# Following the Curriculum Guide

## Scheduling

### Use label selectors to schedule Pods

```yaml
...
spec:
  key1: value1
  keyN: valueN
```

### Understand the role of DaemonSets

Every node in the cluster (taints permitting)

### Understand how resource limits can affect Pod scheduling

Prevents scheduling if you hit your quota.

### Understand how to run multiple schedulers and how to configure Pods to use them

You create a scheduler, run it in the cluster, configure RBAC for the new scheduler, and add the `schedulerName:` key to your Pod's spec.

https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/

### Manually schedule a Pod without a scheduler

This either means static pods, manifest, or running a pod with a predefined node name.

### Display scheduler events

`kubectl get events`

### Know how to configure the Kubernetes scheduler

You can adjust the percentage of nodes that is scored, and you can use predicates to adjust how the scheduler scores the nodes that fit the schedule the best.

## Logging/Monitoring

### Understand how to monitor all cluster components

Using Heapster in the old version, and kube-state-metrics in newer version.

### Understand how to monitor applications

Using tracing built into the app, or using a third party tool like Prometheus or Fluentd.

### Manage cluster component logs

These will show up in `/var/log/`, the journal, or contianer logs.

### Manage application logs

Using a third party tool like Fluentd to ship them.

## Application Lifecycle Management

### Use label selectors to schedule Pods

Using replicas with selectors.

```yaml
selector:
    matchLabels:
        key1: value1
        keyN: valueN
```

### Understand the role of DaemonSets

Every node in the cluster (taints permitting)

### Understand how resource limits can affect Pod scheduling

Prevents scheduling if you hit your quota.

### Understand how to run multiple schedulers and how to configure Pods to use them

You create a scheduler, run it in the cluster, configure RBAC for the new scheduler, and add the `schedulerName:` key to your Pod's spec.

https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/

### Manually schedule a Pod without a scheduler

This either means static pods, manifest, or running a pod with a predefined node name.

### Display scheduler events

`kubectl get events`

### Know how to configure the Kubernetes scheduler

You can adjust the percentage of nodes that is scored, and you can use predicates to adjust how the scheduler scores the nodes that fit the schedule the best.

## Cluster

### Understand Kubernetes cluster upgrade process

`kubeadm upgrade` and follow the prompts, pretty much.

### Facilitate operating system upgrades

Cordon the node and drain it, update it, and uncordon.

### Implement backup and restore methodologies

This was a pain. Basically backup etcd and restore that.

## Security

### Know how to configure authentication and authorization

https://kubernetes.io/docs/reference/access-authn-authz/authentication/#authentication-strategies

Basically you can pass a few different flags to the kube-apiserver binary at startup. You can use OIDC, basic auth, token auth, or authorization webhook.

Authorization is configured similarly. You can use ABAC, RBAC, Webhooks, deny all, and allow all.
https://kubernetes.io/docs/reference/access-authn-authz/authorization/

### Understand Kubernetes security primitives

Network Policies, Service Accounts, RBAC, and ABAC, I think is what this is referring to.

### Know to configure network policies

I need to work on these more, but they aren’t too bad. They look very much like all ingress/egress rules, but with more flexibility.

https://github.com/ahmetb/kubernetes-network-policy-recipes
https://kubernetes.io/docs/concepts/services-networking/network-policies/

### Create and manage TLS certificates for cluster components

Oh joy. This is doable, but a pain unless you use kubeadm.

https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-certs/

You can use kubectl to sign csr request.

https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/

There is also the painful work of doing it manually with tools like openssl or cfssl.

https://kubernetes.io/docs/concepts/cluster-administration/certificates/

### Work with images securely

I thought there was a Kubernetes native way to restrict where images come from, but I can’t find it. You can use Docker secure images signing, but I don’t know if you can leverage anything similar with other container runtimes. Besides that, everything I see is just the normal conatianer image best practices.

### Define security contexts

Various security context for pods can be configured like runAsRoot, runAsNonRoot, and settings for things like AppArmor and SELinux.

### Secure persistent key value store

I think this is referring to ETCD encryption at rest.

https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/

## Storage

### Understand persistent volumes and know how to create them

https://kubernetes.io/docs/concepts/storage/persistent-volumes/

Basically PVs are the underlying storage, and they several classifications based on what the administrator sets. Then you use PVCs to carve off some storage from a PV, and give them to the pod(s).

### Understand access modes for volumes

https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes

ReadWriteOnce
ReadOnlyMany
ReadWriteMany

### Understand persistent volume claims primitive

Basically they are the amount and class of storage to take, whether it's a block device or filesystem, how to access it, and the usual metadata.

### Understand Kubernetes storage objects

I think this is referring to the `StorageClass`, but it could be `PersistentVolumes` amd `PersistentVolumesClaims`.

### Know how to configure applications with persistent storage

Add a `volumes` block to your pod spec give it a `persistentVolumeClaim` object.

## Troubleshooting

### Troubleshoot application failure

This is a big topic, but I'm pretty good at this.

https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/

### Troubleshoot control plane failure

Again a big topic.

https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/

### Troubleshoot worker node failure

https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/

### Troubleshoot networking

https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/

Plus dig, tcpdump, ping, telnet, nc, etc...

## Core Concepts

### Understand the Kubernetes API primitives

Way to broad for me to bother with notes.

### Understand the Kubernetes cluster architecture

Way to broad for me to bother with notes.

### Understand Servicesa nd other network primitives

Way to broad for me to bother with notes.

## Networking

### Understand the networking configuration on the cluster nodes

This is done through CNI and tools like Flannel or Calico.

I should probably deep dive more on Flannel.

### Understand Pod networking concepts

Really depends on the CNI used, but the gist of it is IP Tables or IPVS

### Understand service networking

Services make deployments discoverable through cluster IPs, and can do things like associate with LBs and such.

### Deploy and configure network load balancer

https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/

Basically `type: LoadBalancer` in the service object, and you can add a few items of configuration if you would like.

### Know how to use Ingress rules

I do this almost every day.

https://kubernetes.io/docs/concepts/services-networking/ingress/

### Know how to configure and use the cluster DNS

Usage is pretty straight forward.

https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/

Basically if your DNS is pointed at KubeDNS or CoreDNS, you use the A records as shown.

You can configure things such as the Pod's DNS Policy, and the services can publish `ExternalName`.

### Understand CNI

I'm familiar with it, but not really sure what to put here besides this.

https://kubernetes.io/docs/concepts/cluster-administration/networking/#kubernetes-model

