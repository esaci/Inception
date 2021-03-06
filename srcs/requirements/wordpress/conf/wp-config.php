<?php
// supported clients: `phpredis`, `credis`, `predis` and `hhvm`
// define( 'WP_REDIS_CLIENT', 'phpredis' );

// automatically delete cache keys after 7 days
// define( 'WP_REDIS_MAXTTL', 60 * 60 * 24 * 7 );

// bypass the object cache, useful for debugging
// define( 'WP_REDIS_DISABLED', true );

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MARIADB_DATABASE') );

/** MySQL database username */
define( 'DB_USER', getenv('MARIADB_USER') );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('MARIADB_PASSWORD') );

/** MySQL hostname */
define( 'DB_HOST', getenv('MARIADB_HOST').':'.getenv('MARIADB_PORT') );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         	'gkhfdkjg gfdkngkjdfngkjdfngkdfngdfgdf]][][][]876456546gfdg45elias' );
define( 'SECURE_AUTH_KEY',  	'564987698456k45jh6j54h6i45hghhfghfhgfhfghfg77777676h67h6h76helias' );
define( 'LOGGED_IN_KEY',    	'54hiug8745g745mg4h67h67h67h6fdgdfgfdgdfgderrtykhghki77h67h76elias' );
define( 'NONCE_KEY',        	'g45jg484gn48ng4gh76h667h6fdh6544^*&43934324]]]]fdgfdgfd76h67elias' );
define( 'AUTH_SALT',        	'gjk45hgjk4i89g54gn4k4gh67h67h67hiug8745g74h67h67hiug8745gh67elias' );
define( 'SECURE_AUTH_SALT', 	'g;jfgj956hgfhgfhplh5h67h67h67h67h67hcxcxzczxczxczxczxcz67h67elias' );
define( 'LOGGED_IN_SALT',   	'hfghfghfgpohi869hj679hj698j6798hj98j6xzczxcc67h67h67h67h67h6elias' );
define( 'NONCE_SALT',       	'iuyerw7548htkkkjthriethreiuht894589gh94948hggh498hgldjgingeoelias' );
define( 'WP_CACHE_KEY_SALT',	'4k4gh67h67h67hiug8745g74h67h67hiug84k4gh67h67h67hiug8745g74h67has' );

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';




/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
