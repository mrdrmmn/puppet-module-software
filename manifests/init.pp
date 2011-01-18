# Definition: software
#
# This module manages software
#
# Parameters:
#
# Actions:
#
# Requires: none
#
# Sample Usage:
#   software { "apg": }
#   software { "apg": ensure => 'absent' }
#
# [Remember: No empty lines between comments and class definition]
define software(
    $package   = "",
    $ensure    = "",
    $provider  = "",
    $source    = "",
    $type      = "",
) {
    $default_ensure   = "present"
    $default_provider = $operatingsystem ? {
                            Solaris => "pkg",
                            default => "",
                        }
    $default_package  = $name
    $default_source   = ""
    $default_type     = "package"
    
    # Load software defaults from the appropriate manifest.
    include "software::$name"
    $software_ensure      = inline_template("<%= scope.lookupvar(\"software::${name}::ensure\"  ) %>")
    $software_provider    = inline_template("<%= scope.lookupvar(\"software::${name}::provider\") %>")
    $software_package     = inline_template("<%= scope.lookupvar(\"software::${name}::package\" ) %>")
    $software_source      = inline_template("<%= scope.lookupvar(\"software::${name}::source\"  ) %>")
    $software_type        = inline_template("<%= scope.lookupvar(\"software::${name}::type\"    ) %>")
    
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

    if( $type != "" ) {
        $real_type = $type
    } 
    else {
        if( $software_type != "" ) {
            $real_type = $software_type
        }
        else {
            $real_type = $default_type
        }
    }

    if( $type == "package" ) {
        case $provider {
            "sunfreeware": {
                software { "pkg-get": ensure => "present"; }
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
}
