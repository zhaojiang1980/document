搜索并清空日志文件

#!/bin/bash
cd /var/lib/docker/containers && find ./ -name '*.log'  |xargs -I {} sh -c '> {}'



搜索并删除1天前的日志文件

#!/bin/bash

find / -mtime +1 -name '*.log'|xargs rm -fr
