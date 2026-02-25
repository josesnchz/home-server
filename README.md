# HomeLab

This repository hosts the inventory, configuration, and planning for my personal home server setup.

The main philosophy of this project is to maintain a high-performance environment while keeping it budget-friendly and scalable, utilizing enterprise-grade recycled hardware and efficient ARM processors.

## Inventory

This project will use the following hardware.

#### Host #1 

This is the computing host. This host is responsible of doing most of the intense computing tasks. 

For that purpose, the hardware that it will use:
* MB: Machinist X99 RS9
* CPU: Intel Xeon E5 2680 V4
* RAM: 2x Machinist 16G 3200MHz
* GPU: RX580 SOYO GB
* PSU: Nox Urano VX 750W
* Storage: 1TB SATA SSD 

#### Host #2

Consists on a Raspberry Pi5/4GB acting as the management layer (Orchestration, Monitoring, and Core Services).


#### Networking

The components that will be used to connect all different hosts:
* Switch Mercusys MS105G
* Router Tenda RX2 Pro AX1500


## The Setup

#### Host #1 Configuration

Uses Proxmox VE as the base Type-1 Hypervisor. Using 50GB dedicated for the system and reserving two cores for it.

Three Ubuntu Server machines running are running as nodes are deployed in this host.

|        | Node 1            | Node 2  | Node 3  |
|--------|-------------------|---------|---------|
| CPU    | 4 cores           | 4 cores | 4 cores |
| RAM    | 12 GB             | 8GB     | 8GB     |
| V Disk | 250GB             | 100GB   | 100GB   |
| GPU    | RX580 Passthrough |         |         |

Special considerations:
* Since using a single SSD, will use VirtIO SCSI Single as controller, with Discard option
Storage: Configure LVM-Thin for VM disks and ZFS (optional) for data integrity.
* FileSystem: LVM-Thin for higher performance.
* Passthrough to Node 1.

  
#### Host #2 Configuration

K3S Control Plane node.

