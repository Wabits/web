#!/bin/sh
#此脚本用于首次获取资源列表

#检查环境变量
if [ -z "${GITHUB_AUTH}" ]; then
    echo "[WARN]您未将Github Personal Access Token添加到环境变量中,会有60Req/h/IP的速率限制,详见 https://github.com/DreamOfIce/HoYoRandom-php/blob/main/deploy.md#环境变量"
fi

if [ -z "${WEBHOOK_SECRECT}" ]; then
    echo "[WARN]您未设置Webhook验证,请勿在生产环境中使用此配置,详见 https://github.com/DreamOfIce/HoYoRandom-php/blob/main/deploy.md#环境变量"
fi

if [ -z "$RES_REPO_NAME" ]; then
    echo "[WARN]未设置资源仓库,使用默认值'DreamOfIce/HoYoRandomResources' !"
    export RES_REPO_NAME='DreamOfIce/HoYoRandomResources'
fi

#添加PHP到PATH(适用于heroku系)
if [ -e './.heroku' ]; then
    echo 'Add PHP to path'
    export PATH="${PWD}/.heroku/php/bin"
fi

#执行update.php
php ./update.php > /dev/null

echo 'Done!'
exit 0