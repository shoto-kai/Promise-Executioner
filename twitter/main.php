<?php

require "vendor/autoload.php";

use Abraham\TwitterOAuth\TwitterOAuth;

$apiKey = TWITTER_API;
$apiSecret = TWITTER_API_SECRET;
$accessToken = TWITTER_ACCESS_TOKEN;
$accessTokenSecret = TWITTER_ACCESS_TOKEN_SECRET;

$user = "お金配り太郎";
$title = "7時に起きる";
$payment = "500";
$url = "paypayのリンク";

$connection = new TwitterOAuth($apiKey, $apiSecret, $accessToken, $accessTokenSecret);
$connection->setApiVersion("2");
$result = $connection->post("tweets", ["text" => "{$user}さんが「{$title}」を失敗しました。\n代償として{$payment}円を配布します。\n先着1名が以下のリンクから受け取れます。\n{$url}"], true);