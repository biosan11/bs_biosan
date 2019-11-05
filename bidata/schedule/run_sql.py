#!/usr/bin/env python
# -*- coding:utf-8 -*-
# author:Jin

import os
import schedule,datetime,time
import commands
def sqldir(path):
    sqlpath_list = []
    for file in os.listdir(path):
        file_path = os.path.join(path,file)
        if os.path.isfile(file_path):
            if os.path.splitext(file_path)[1] == ".sql":
                sqlpath_list.append(file_path)
    sqlpath_list.sort(key=lambda x:int(x[len(path):len(path)+x[len(path):].find("_")]))
    return sqlpath_list

def run_sql(path):
    today = datetime.datetime.today()
    sqlpath_list = sqldir(path)
    with open("/home/bidata/bidata/log/log.txt","a+") as log:
        log.write("\n\n\n\nUSE SCHEDULE")
        log.write("\ndate:%s\n**************************" %today)
    for sqlpath in sqlpath_list:
        print(sqlpath)
        command = "mysql -h172.16.0.181 -p3306 -uroot -pbiosan <%s" %sqlpath
        (status, output) = commands.getstatusoutput(command)
        now = time.strftime("%H:%M:%S")
        print(status)
        with open("/home/bidata/bidata/log/log.txt","a+") as log:
            log.write("\ntime:%s\n-----------------------\n" %now)
            log.write("%s\n%s\n%s" %(sqlpath,status,output))

def job1():
    path = "/home/bidata/bidata/sql/"
    run_sql(path)

if __name__=='__main__':
    schedule.every().day.at("4:00").do(job1)
    # schedule.every().day.at("17:25").do(job1) #191105修改 这个脚本每天下午不自动跑 在调度工具中运行
    while True:
        schedule.run_pending()
        time.sleep(1)




