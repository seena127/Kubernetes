Kubernetes Architecture

Master or managed node:

1)ETCD – It is a distributed  key value pair database which consists of all cluster relevant data

API server of managed node communicates when ever there is a change in cluster configuration and updates the relevant data change in ETCD database. It makes sure the cluster is highly available and must be ensured that it is secure. 

Webhooks can be used to check events in ETCD.

It uses raft consensus algorithm for consistency and replicates data across all nodes to ensure durability

For backup of etcd the following command can be used:

ETCDCTL_API=3 etcdctl snapshot save <backup-file>

For monitoring using Prometheus:

ETCDCTL_API=3 etcdctl endpoint health

2) API Server – It is main component in control plane. All cluster communication is performed through api server. 

It provides RESTFUL API for communication between the cluster interface and user

It communicates with user through kubectl or Kubernetes dashboard or other components updates the data in etcd and applies the configuration as provided by user

It is the entry point for all cluster based or administrative tasks

Provides RBAC for authorization and for authentication tokens, certificates and oauth applications are used

3)Kube Scheduler – Assigns a pod to node based on various factors , constraints and scheduling policies

Factors that are taken into consideration by scheduler are taints and tolerations, CPU and Memory requests, Node affinity and anti affinity, Pod distribution for optimal cluster utilization and fault tolerance to maintain balance, custom constraints ( selector, labels, priority classes and custom schedulers)

4) Kube Controller Manager -  It maintains multiple controllers which are responsible to monitor the state of cluster and make sure that the desired state and actual state are same and make sure that the configuration is applied as specified by the user.

Types:

Node controller – checks for node failures and updates the status in API server

Replication Controller – Makes sure to launch mentioned number of replicas of pods are executed

Deployment controller – Manages deployment lifecycle, roll back, scaling and update handling

Job Controller – Make sure that jobs perform the mentioned number of executions at mentioned time

Daemonset controller – Make sure pod runs in all nodes or specified nodes

Statefulset controller – Manages stateful apps maintaining uniqueness and scaling

Endpoint controller – Fills endpoint object with address of pods linked to service

PV Controller – Manages lifecycle of PV and PVC

Namespace controller- Manages lifecycle of namespaces

5)Cloud controller manager(optional) – It helps to integrate cloud specific features in to Kubernetes by reducing gap between them and managing the cloud resources through Kubernetes

Tasks performed are Node management , Load balancer management, persistent volume management and route management

Worker Node-

1)Kubelet – It is node agent that run in each and every node and maintains the state of container as specified by user and containers are running healthy.

It updates the pod information to API server and performs the tasks specified by API server. It fetches pods not containers

Tasks performed by Kubelet are pod lifecycle management, health monitoring, Node status, Volume Management and container management, checks for readiness

2)Kube proxy – It is responsible for maintaining networking rules for communication between pods, services and other external resources

It runs on each node and maintains network rules, load balancing and managing network policies

Task performed by it are service abstraction, traffic forwarding, network rules management and IP Translation

3)Container runtime – It is the software that is responsible for running containers in each node. It interacts with the kubelet to manage the lifecycle of containers, including pulling images, creating 
containers, running them, and stopping them when needed.

A container runtime implements the Container Runtime Interface (CRI), a set of APIs that Kubernetes uses to interact with the underlying container engines. Kubernetes itself does not mandate a specific container 
runtime, but it provides the flexibility to choose the one that best suits your needs, whether it’s Docker, containerd, or CRI-O.


