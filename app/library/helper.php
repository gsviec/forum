<?php

use Phalcon\Debug\Dump;
if (!function_exists('d')) {
    /**
     * Dump the passed variables and end the script.
     *
     * @param  mixed
     * @return void
     */
    function d()
    {
        array_map(function ($x) {
            $string = (new Dump(null, true))->variable($x);
            echo (PHP_SAPI == 'cli' ? strip_tags($string) . PHP_EOL : $string);
        }, func_get_args());
        die(1);
    }
}

function getUrlAvatar($email, $s = 32, $d = 'identicon', $r = 'pg')
{

    $url = 'https://www.gravatar.com/avatar/';
    $url .= md5(strtolower(trim($email)));
    $url .= "?s={$s}&d={$d}&r={$r}";
    return $url;
}