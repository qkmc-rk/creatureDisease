rm -rf /usr/local/apache-tomcat-8.5.50/webapps/ROOT
cp -r ~/dist /usr/local/apache-tomcat-8.5.50/webapps
cd /usr/local/apache-tomcat-8.5.50/webapps
mv dist ROOT
cat 1>&2 <<EOF
+======================================================================+
|                    Message: deploy finished!                         |
+----------------------------------------------------------------------+
|          If you are interested with author,contact at:               |
|               > https://www.ruankun.xyz                              |
|               > qkmc@outlook.com                                     |
|               > QQ: 314445437                                        |
|                                                                      |
| All rights Reserved.                                                 |
+======================================================================+
EOF
exit 1