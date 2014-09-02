<?php
  function embed_theme_setup() { 
     add_theme_support( 'custom-background', array(
	    'default-color' => 'ffffff',
            'default-image' => get_stylesheet_directory_uri() . '/images/background.png',
	) );
 }
 
add_action( 'after_setup_theme', 'embed_theme_setup' );

