<?php
/**
 * Humber & Lincolnshire Events Theme Customizer.
 *
 * @package Humber_&_Lincolnshire_Events
 */

/**
 * Add postMessage support for site title and description for the Theme Customizer.
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function humber_lincolnshire_events_customize_register( $wp_customize ) {
	$wp_customize->get_setting( 'blogname' )->transport         = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport  = 'postMessage';
	$wp_customize->get_setting( 'header_textcolor' )->transport = 'postMessage';
}
add_action( 'customize_register', 'humber_lincolnshire_events_customize_register' );

/**
 * Binds JS handlers to make Theme Customizer preview reload changes asynchronously.
 */
function humber_lincolnshire_events_customize_preview_js() {
	wp_enqueue_script( 'humber_lincolnshire_events_customizer', get_template_directory_uri() . '/js/customizer.js', array( 'customize-preview' ), '20151215', true );
}
add_action( 'customize_preview_init', 'humber_lincolnshire_events_customize_preview_js' );
