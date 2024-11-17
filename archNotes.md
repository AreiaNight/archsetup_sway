## First stepts

Change the /etc/pacman.conf
Look for pareallel downloads, desmark
Update repos pacman -Sy

> If it you can't download, use for iwctl |
> adapter list | 
> look for you adapter | 
> adapter /name/ set-property Powered on |
> device list |
> device /name/ set-property Powered on |
> station /name/ scan |
> station /name/ get-networks |
> station /name/ connect /red/ |

Pamcan -Sy
arch install

## Install

Select mirrors. 
Nearest mirror NA
> Use / for search 
Normal installation process (at least, easier than black arch)

## Side notes -spanish related- 
Formatear el disco para instalar Arch Linux como sistema operativo nativo en una laptop HP es un paso importante que debe realizarse con cuidado. Aquí tienes los pasos generales:

---

### **1. Preparar un medio de instalación**
- Descarga la **ISO oficial de Arch Linux** desde [archlinux.org](https://archlinux.org).
- Usa una herramienta como **Rufus** (Windows), **balenaEtcher** o el comando `dd` (Linux) para crear un USB booteable.

---

### **2. Iniciar desde el USB booteable**
1. Inserta el USB en la laptop HP.
2. Reinicia la laptop y entra al **menú de inicio/BIOS** presionando la tecla correspondiente (usualmente `F9`, `Esc` o `F10` para HP).
3. Selecciona el USB como dispositivo de arranque.

---

### **3. Configurar la conexión a Internet**
- Verifica la conexión con `ping archlinux.org`.
- Configura la red si es necesario:
  - Ethernet: usualmente configurado automáticamente.
  - Wi-Fi: utiliza `iwctl` para conectarte.

---

### **4. Identificar el disco**
- Lista los discos con:
  ```bash
  lsblk
  ```
- Identifica el disco principal (por ejemplo, `/dev/sda`, `/dev/nvme0n1`, etc.).

---

### **5. Crear y formatear particiones**
#### a) **Decidir particionamiento**
   - **Tabla de particiones GPT** (recomendada para UEFI).
   - **Particiones típicas:**
     - **EFI**: 512 MB, tipo FAT32.
     - **Raíz (`/`)**: 20-50 GB o más, tipo ext4.
     - **Swap** (opcional): 2-4 GB, dependiendo de la RAM.
     - **Home (`/home`)**: resto del disco, tipo ext4.

#### b) **Usar `fdisk` o `cfdisk`**
   Ejemplo con `fdisk`:
   1. Inicia `fdisk` en el disco:
      ```bash
      fdisk /dev/sda
      ```
   2. Borra particiones existentes (`d`) si es necesario.
   3. Crea una nueva tabla de particiones (`g` para GPT).
   4. Crea nuevas particiones (`n`) según tu esquema.
   5. Cambia el tipo de la partición EFI a `EFI System` (`t`, luego selecciona `1`).
   6. Guarda los cambios (`w`).

#### c) **Formatear particiones**
   - **EFI**:
     ```bash
     mkfs.fat -F32 /dev/sda1
     ```
   - **Raíz (`/`)**:
     ```bash
     mkfs.ext4 /dev/sda2
     ```
   - **Home (`/home`)** (si aplica):
     ```bash
     mkfs.ext4 /dev/sda3
     ```
   - **Swap** (si aplica):
     ```bash
     mkswap /dev/sda4
     swapon /dev/sda4
     ```

---

### **6. Montar particiones**
- Monta la partición raíz:
  ```bash
  mount /dev/sda2 /mnt
  ```
- Crea directorios para EFI y `/home`:
  ```bash
  mkdir /mnt/boot
  mkdir /mnt/home
  ```
- Monta las particiones adicionales:
  ```bash
  mount /dev/sda1 /mnt/boot
  mount /dev/sda3 /mnt/home
  ```

---

## Keep going
pacman -Syu
pacman -S yay
yay -S git

clone this repo
run this depo