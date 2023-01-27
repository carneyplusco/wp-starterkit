<?php

add_action('init', function () {
	// create admin-level developer role
	$admin_capabilities = get_role('administrator')->capabilities;
	add_role('developer', 'Developer', $admin_capabilities);

	// hide ACF options for all users except developers
	add_filter(
		'acf/settings/show_admin',
		function () {
			if (!is_user_logged_in()) {
				return false;
			}

			global $current_user;
			$user_roles = $current_user->roles;

			return in_array('developer', $user_roles);
		}
	);
});