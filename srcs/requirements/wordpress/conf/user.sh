wp core install --url=localhost --title="Inception" --admin_user=${DB_USER} --admin_password=${DB_PASS} --admin_email=${DB_EMAIL} --skip-email
if wp user get user42 >/dev/null 2>&1; then
    echo "User user42 exists."
else
   wp user create ${USER} ${WP_EMAIL} --role=subscriber --user_pass=${DB_PASS} --skip-email
fi
wp user update "${USER}" --user_pass="${DB_PASS}" --skip-email
if wp user get "${USER}" >/dev/null 2>&1; then
    echo "Logged in successfully as root."
else
    echo "Login failed. Please check your root credentials."
fi
wp theme activate twentytwentytwo
/usr/sbin/php-fpm83 -F
