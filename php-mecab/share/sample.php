<?php
$input = file_get_contents('php://stdin');
$mecab = new MeCab_Tagger();
$ret = $mecab->parseToString($input);
print_r($ret);

