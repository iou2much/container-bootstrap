import etcd
import docker
import time,json

etcdClient = etcd.Client(host='etcd.svc', port=2379)
dockerClient = docker.Client(base_url='unix://tmp/docker.sock')

for e in dockerClient.events(since=time.time()):
    e = json.loads(e)
    if 'status' in e and e['status'] in ['destroy','pause','unpause','stop','die','kill'] and 'Actor' in e:
        cname = e['Actor']['Attributes']['name']
        try:
            ret = etcdClient.delete('/trackdown/%s'%(cname))
        except etcd.EtcdKeyNotFound:
            print '/trackdown/%s is not exists...'%(cname)
        else:
            try:
                ret = etcdClient.delete(ret._prev_node.value)
            except etcd.EtcdKeyNotFound:
                print '/trackdown/%s is not exists...'%(ret._prev_node.value)
        



#    ret = etcdClient.watch('/trackdown/',recursive = True)
#    print ret._prev_node.key
#    print ret._prev_node.value
