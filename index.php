<?php

$hook = file_get_contents('php://input');

$hookDecoded = json_decode($hook, true);

if (null === $hookDecoded) {
    exit(1);
}

$replaces = [
    'cabinet' => 'istat',
];

$hookDecoded['repository']['name'] = mb_strtolower($replaces[$hookDecoded['repository']['name']] ?? $hookDecoded['repository']['name'], 'utf-8');

$homepage = parse_url($hookDecoded['repository']['homepage'] ?? $hookDecoded['repository']['links']['html']['href']);

file_put_contents('logs/webhooks/'.$homepage['host'].'_'.date('d-m-Y').'.log', $hook.PHP_EOL, FILE_APPEND);

$pushLog = shell_exec('./sync.sh '.$hookDecoded['repository']['name'].' '.$homepage['host']);

$pushLog .= '//--------------------------------------------------------------------------------------------------------';

file_put_contents('logs/pushes/'.$homepage['host'].'_'.date('d-m-Y').'.log', $pushLog.PHP_EOL, FILE_APPEND);