<?php

echo "Extensions:\n";
$exts = get_loaded_extensions();

echo sizeof($exts) . " total\n\n";

foreach($exts as $k => $value){
	try {
		$version = phpversion($value);    
		echo "[$k] $value => $version\n";
	} catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
	}
}

echo "\nEND\n";
