# Links

# AutoScaling

**Horizontal Pod Scaler** is pretty sweet. I didn't know that it was set by default and scaled up replica's based on 50% or more CPU usage.

**Vertical Pod Scaler** sounds awesome! I'll have to read into that more.
It's still in Alpha, and it requires the metrics server, which is not installed by default.
https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscalerw

# Deployments

`--record` is a cool flag I didn't know about, but it looks like it will probably be deprecated at some point.
https://github.com/kubernetes/kubernetes/issues/40422

`kubectl rolling-update` command requires the terminal stay open. That's something I didn't know either, but never cared to try.

ReplicaSets can take ownership of existing pods, provided the pods containers all of the labels matching the selector for the RS.

I learned something new today. DaemonSets can have a `RollingUpdate` policy. I guess I never gave it much thought, but that makes sense.

# Services

A service can route traffic to multiple pods with different ports, provided they match the same string, like "httpPort". I suppose that makes sense as it would allow you to change a port during a new deployment really easily, and I've seen this done before.

Services can point to things not in Kubernetes. This is done through ExternalName service type.

`kubectl proxy` proxies to apps differently than I thought. I'll want to revisit this, prior to the exam.

https://kubernetes.io/docs/tasks/access-application-cluster/access-cluster/#manually-constructing-apiserver-proxy-urls

https://github.com/kubernetes-incubator/cluster-proportional-autoscaler

`kube-dns` logs will show `W` for warning `E` for error, and `F` for failure.

# Storage

* NFS and ISCSI for multiple reads
* rbd (read into more), CephFS, and GlusterFS are good for multiple writes
* emptyDir does not create volume on host, but create directory in the container(s)
* hostPath is exactly as it sounds
* Cloud provider volume options are just that

## PV and PVC

PV is the abstraction layer on persistent storage. PVC is the volume type the container uses to claim a PV.

PVCs have a reclaim policy which says to delete, retain, or recycle (deprecated) a volume.

I never remember the [Access Modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes).

When a volume is in the `failed` phase, it means "the volume has failed its automatic reclamation".

```powershell
# NFS server
cd nfs-pv-server/
vagrant up

# Single-node Kubernetes server
cd ../
vagrant up

# On all possible nodes the pod will run on
apt install -y nfs-common

# Then follow the stuff in Exercise 9.2 Step 6 onward.
```