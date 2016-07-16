
docker run --name weibo -v /home/data/callcenter_1769152985:/var/lib/mysql/callcenter_1769152985 -v /home/data/100G/callcenter_1647850037:/var/lib/mysql/callcenter_1647850037 -P -v /home/data/100G:/var/lib/mysql/100G -e MYSQL_ROOT_PASSWORD=b49cc7735e4 -d mysql:5.6
