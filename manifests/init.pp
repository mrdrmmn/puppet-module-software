define software(
    $package   = "",
    $ensure    = "",
    $provider  = "",
    $source    = ""
) {
    $default_ensure   = "present"
    $default_provider  = $operatingsystem ? {
        'Solaris' => $operatingsystemrelease ? {
            '5.11'  => "pkg",
            default => "",
        },
        default   => "",
    }
    $default_package  = $name
    $default_source   = ""
    

    include "software::$name"
    $software_ensure   = inline_template("<%= scope.lookupvar(\"software::${name}::ensure\"  ) %>")
    $software_provider = inline_template("<%= scope.lookupvar(\"software::${name}::provider\") %>")
    $software_package  = inline_template("<%= scope.lookupvar(\"software::${name}::package\" ) %>")
    $software_source   = inline_template("<%= scope.lookupvar(\"software::${name}::source\" ) %>")
    
    if( $package != "" ) {
        $real_package = $package
    }
    else {
        if( $software_package != "" ) {
            $real_package = $software_package
        }
        else {
            $real_package = $default_package
        }
    }

    if( $ensure != "" ) {
        $real_ensure = $ensure
    } 
    else {
        if( $software_ensure != "" ) {
            $real_ensure = $software_ensure
        }
        else {
            $real_ensure = $default_ensure
        }
    }

    if( $provider != "" ) {
        $real_provider = $provider
    } 
    else {
        if( $software_provider != "" ) {
            $real_provider = $software_provider
        }
        else {
            $real_provider = $default_provider
        }
    }

    if( $source != "" ) {
        $real_source = $source
    } 
    else {
        if( $software_source != "" ) {
            $real_source = $software_source
        }
        else {
            $real_source = $default_source
        }
    }

    case $provider {
        /(sunfreeware|blastwave)/: {
            software { "pkg-get": ensure => "present"; }
            file { "/usr/bin/pkg-get":
                ensure  => "/opt/csw/bin/pkg-get",
                require => Software["pkg-get"],
            }
            Software[$name] { require +> Software["pkg-get"] }
            realize Software[$name]
        }
    }

    @package { $real_package: 
        ensure   => $real_ensure,
    }

    if( $real_package != $name ) {
        Package[$real_package] { alias +> $name }
    }

    if( $real_provider ) {
        Package[$real_package] { provider +> $real_provider }
    }

    if( $real_source ) {
        Package[$real_package] { source +> $real_source }
    }

    realize Package[$real_package]
}
