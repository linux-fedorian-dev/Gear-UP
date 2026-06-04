#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' 

success() { echo -e "${GREEN}✅ $1${NC}"; }
info() { echo -e "${BLUE}➡️ $1${NC}"; }
warn() { echo -e "${YELLOW}⚠️ $1${NC}"; }
error() { echo -e "${RED}❌ $1${NC}"; }

checkfail() {
    if [ $? -eq 0 ]; then
        success "success"
    else 
        error "installing error"
    fi
}

ask_yn() {
    local answer
    while true; do
        read -p "$1 (y/n): " answer
        case "$answer" in
            [yY]) return 0 ;;
            [nN]) return 1 ;;
            *) echo "Error: Please enter y or n only." ;;
        esac
    done
}

presstocontinue() {
    echo "" 
    echo -n "Press any key to continue..."
    read -n 1
}

read_choice() {
    local choice
    local min=${1:-1}
    local max=${2:-9}
    while true; do
        read -p "Enter your choice (${min}-${max}): " choice
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge "$min" ] && [ "$choice" -le "$max" ]; then
            echo "$choice"
            return 0
        else
            echo -e "${RED}Invalid choice. Please enter a number between ${min} and ${max}.${NC}"
        fi
    done
}

Internet() {
    clear
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo -e "${BOLD}${BLUE}        🌐 INTERNET TOOLS${NC}"
    echo -e "${BOLD}${BLUE}============================================${NC}"
    
    INSTALL_TELEGRAM=false
    INSTALL_FREETUBE=false
    INSTALL_DISCORD=false

    ask_yn "Do you want to install Telegram?" && INSTALL_TELEGRAM=true
    ask_yn "Do you want to install FreeTube?" && INSTALL_FREETUBE=true
    ask_yn "Do you want to install discord?" && INSTALL_DISCORD=true

    if [ "$INSTALL_TELEGRAM" = true ]; then
        info "Installing Telegram..."
        flatpak install -y flathub org.telegram.desktop
        checkfail
    fi

    if [ "$INSTALL_FREETUBE" = true ]; then
        info "Installing FreeTube..."
        flatpak install -y flathub io.freetubeapp.FreeTube
        checkfail
    fi

    if [ "$INSTALL_DISCORD" = true ]; then
        info "Installing Discord..."
        sudo dnf install -y discord
        checkfail
    fi
    presstocontinue
}

Office() {
    clear
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo -e "${BOLD}${BLUE}               📊 OFFICE${NC}"
    echo -e "${BOLD}${BLUE}============================================${NC}"

    INSTALL_LIBRE=false
    INSTALL_ONLY=false

    ask_yn "Do you want to install Libre Office?" && INSTALL_LIBRE=true
    ask_yn "Do you want to install Only Office?" && INSTALL_ONLY=true
    if [ "$INSTALL_LIBRE" = true ]; then
        info " Installing Libre Office..."
        sudo dnf install -y libreoffice
        checkfail
    fi
    if [ "$INSTALL_ONLY" = true ]; then
        info " Installing Olny Office..."
        flatpak install -y flathub org.onlyoffice.desktopeditors
        checkfail
    fi
    presstocontinue
}

Editing() {
    clear
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo -e "${BOLD}${BLUE}               ✂️ EDITING${NC}"    
    echo -e "${BOLD}${BLUE}============================================${NC}"

    INSTALL_GIMP=false
    INSTALL_KDENLIVE=false
    INSTALL_BLENDER=false
    INSTALL_SHOTCUT=false

    ask_yn "Do you want to Install Gimp?" && INSTALL_GIMP=true
    ask_yn "Do you want to Install kdenlive?" && INSTALL_KDENLIVE=true
    ask_yn "DO you want to Install Blender?" && INSTALL_BLENDER=true
    ask_yn "Do you want to Install Shotcut?" && INSTALL_SHOTCUT=true

    if [ "$INSTALL_GIMP" = true ]; then
        info "Installing GIMP..."
        sudo dnf install -y gimp 
        checkfail
    fi

    if [ "$INSTALL_KDENLIVE" = true ]; then
        info "Installing Kdenlive..."
        sudo dnf install -y kdenlive
        checkfail
    fi

    if [ "$INSTALL_BLENDER" = true ]; then
        info "Installing Blender..."
        sudo dnf install -y blender 
        checkfail
    fi

    if [ "$INSTALL_SHOTCUT" = true ]; then
        info "Installing Shotcut..."
        sudo dnf install -y shotcut
        checkfail
    fi
    presstocontinue
}

GamingPlatforms() {
    clear
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo -e "${BOLD}${BLUE}        🎮 GAMING PLATFORMS${NC}"
    echo -e "${BOLD}${BLUE}============================================${NC}"
    
    INSTALL_STEAM=false
    INSTALL_LUTRIS=false
    INSTALL_HEROIC=false
    INSTALL_PROTONUP=false

    ask_yn "Do you want to install Steam?" && INSTALL_STEAM=true
    ask_yn "Do you want to install Lutris?" && INSTALL_LUTRIS=true
    ask_yn "Do you want to install Heroic Games Launcher?" && INSTALL_HEROIC=true
    ask_yn "Do you want to install ProtonUp-Qt (Proton version manager)?" && INSTALL_PROTONUP=true

    if [ "$INSTALL_STEAM" = true ]; then
        info "Installing Steam..."
        sudo dnf install -y steam 
        checkfail
    fi

    if [ "$INSTALL_LUTRIS" = true ]; then
        info "Installing Lutris..."
        sudo dnf install -y lutris
        checkfail
    fi

    if [ "$INSTALL_HEROIC" = true ]; then
        info "Installing Heroic Games Launcher..."
        flatpak install -y flathub com.heroicgameslauncher.hgl 
        checkfail
    fi

    if [ "$INSTALL_PROTONUP" = true ]; then
        info "Installing ProtonUp-Qt..."
        flatpak install -y flathub net.davidotek.pupgui2 
        checkfail
    fi
    presstocontinue
}

GameGearUP() {
    clear
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo -e "${BOLD}${BLUE}        ⚡ GAMING OPTIMIZATIONS${NC}"
    echo -e "${BOLD}${BLUE}============================================${NC}"
    
    INSTALL_GAMEMODE=false
    INSTALL_MANGOHUD=false
    INSTALL_BTOP=false

    ask_yn "Do you want to install Gamemode (performance optimizer)?" && INSTALL_GAMEMODE=true
    ask_yn "Do you want to install MangoHud (FPS overlay)?" && INSTALL_MANGOHUD=true
    ask_yn "Do you want to install btop (system monitor)?" && INSTALL_BTOP=true

    if [ "$INSTALL_GAMEMODE" = true ]; then
        info "Installing Gamemode..."
        sudo dnf install -y gamemode 
        checkfail
    fi

    if [ "$INSTALL_MANGOHUD" = true ]; then
        info "Installing MangoHud..."
        sudo dnf install -y mangohud
        checkfail
    fi

    if [ "$INSTALL_BTOP" = true ]; then
        info "Installing btop..."
        sudo dnf install -y btop 
        checkfail
    fi
    presstocontinue
}

installcodec() {
    clear
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo -e "${BOLD}${BLUE}        🎬 HARDWARE CODECS${NC}"
    echo -e "${BOLD}${BLUE}============================================${NC}"
    
    install_codec=false
    intel=false
    amd=false
    nvidia=false
    
    ask_yn "Do you want to install codec for your hardware?" && install_codec=true

    if [ "$install_codec" = true ]; then
        
        info "Installing FFmpeg..."
        sudo dnf swap ffmpeg-free ffmpeg --allowerasing
        checkfail
        
        info "Updating multimedia groups..."
        sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
        checkfail

        ask_yn "Is your processor Intel?" && intel=true
        ask_yn "Is your processor AMD?" && amd=true
        if [ "$intel" = true ]; then
            info "Installing Intel media drivers..."
            sudo dnf install -y intel-media-driver 
        fi

        if [[ "$amd" = true && "$intel" = false ]]; then
            info "Installing AMD VA-API drivers..."
            sudo dnf install -y mesa-va-drivers-freeworld
        fi
        checkfail

        ask_yn "Do you have NVIDIA GPU?" && nvidia=true
        if [ "$nvidia" = true ]; then
            info "Installing NVIDIA VA-API driver..."
            sudo dnf install -y libva-nvidia-driver 
            checkfail
        fi

        if ! rpm -q rpmfusion-free-release-tainted &> /dev/null; then
            sudo dnf install -y rpmfusion-free-release-tainted
        fi
        
        if ! rpm -q libdvdcss &> /dev/null; then
            sudo dnf install -y libdvdcss
        fi
        
        success "Codecs installation complete!"
    fi
    presstocontinue
}

NvidiaInstall() {
    clear
    echo -e "${BOLD}${RED}==========================================================${NC}"
    echo -e "${BOLD}${RED}              ⚠️  IMPORTANT NOTICE ⚠️${NC}"
    echo -e "${BOLD}${RED}==========================================================${NC}"
    echo -e "${YELLOW}1. Secure Boot MUST be disabled in your BIOS before installing${NC}"
    echo -e "   ${YELLOW}NVIDIA drivers, otherwise the installation will fail.${NC}"
    echo ""
    echo -e "${YELLOW}2. After installation completes, the system will need 3-10 minutes${NC}"
    echo -e "   ${YELLOW}to build the kernel module in the background.${NC}"
    echo ""
    echo -e "${YELLOW}3. DO NOT restart your computer immediately or turn it off.${NC}"
    echo -e "   ${YELLOW}Wait until the process is complete.${NC}"
    echo -e "${BOLD}${RED}==========================================================${NC}"
    echo ""
    
    if ask_yn "Do you want to install NVIDIA drivers (580xx)?"; then
        info "Adding RPM Fusion (if not already added)..."
        sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        
        info "Installing NVIDIA drivers and CUDA..."
        sudo dnf install -y akmod-nvidia-580xx xorg-x11-drv-nvidia-580xx-cuda
        checkfail
        presstocontinue
        clear
        echo ""
        echo -e "${BOLD}${GREEN}==========================================================${NC}"
        echo -e "${BOLD}${GREEN}        ✅ NVIDIA drivers installed successfully!${NC}"
        echo -e "${BOLD}${GREEN}==========================================================${NC}"
        echo -e "${YELLOW}⚠️  IMPORTANT: The system is now building the kernel module.${NC}"
        echo -e "   ${YELLOW}This takes 3-10 minutes depending on your CPU.${NC}"
        echo ""
        echo -e "${BLUE}💡 HOW TO KNOW IT'S FINISHED:${NC}"
        echo -e "  ${BLUE}1. Open another terminal and run: modinfo -F version nvidia${NC}"
        echo -e "  ${BLUE}2. Or, simply watch the CPU usage in 'System Monitor' or 'btop'${NC}"
        echo -e "  ${BLUE}Once the CPU usage drops to normal (idle), it's done${NC}"
        echo -e "${BOLD}${GREEN}==========================================================${NC}"
    fi
    presstocontinue
}

AsusToolsInstall() {
    clear
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo -e "${BOLD}${BLUE}        🟢 ASUS LAPTOP SETUP${NC}"
    echo -e "${BOLD}${BLUE}============================================${NC}"
    
    asusinstall=false
    ask_yn "Do you want to install asusctl, supergfxctl and rog-control-center (for ASUS laptops)?" && asusinstall=true

    if [ "$asusinstall" = true ]; then
        info "Adding ASUS Linux Terra repository..."
        sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

        info "Installing asusctl, supergfxctl, and rog-control-center..."
        sudo dnf install -y asusctl-rog-gui asusctl 
        checkfail
        info "Enabling and starting services..."
        sudo systemctl enable --now asusd.service

        presstocontinue
        clear
        echo -e "${BOLD}${GREEN}============================================${NC}"
        echo -e "${BOLD}${GREEN}        ✅ ASUS Tools installed successfully!${NC}"
        echo -e "${BOLD}${GREEN}============================================${NC}"
        echo -e "${BLUE}You can now run 'rog-control-center' from your application menu.${NC}"
        echo ""
        echo -e "${BOLD}${YELLOW}💡 TIP FOR YOU:${NC}"
        echo -e "${BOLD}${YELLOW}═══════════════════════════════════════════════════════${NC}"
        echo -e "${YELLOW}  If your laptop has both an integrated and a dedicated GPU,${NC}"
        echo -e "${YELLOW}  make sure to set the 'ROG Control Center' to 'Hybrid' mode.${NC}"
        echo -e "${YELLOW}  This will let the system automatically manage the GPUs${NC}"
        echo -e "${YELLOW}  and give you the best balance between performance and battery.${NC}"
        echo -e "${BOLD}${YELLOW}═══════════════════════════════════════════════════════${NC}"
    fi
    presstocontinue
}

DevelopmentTools() {
    clear
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo -e "${BOLD}${BLUE}        🛠️  DEVELOPMENT TOOLS${NC}"
    echo -e "${BOLD}${BLUE}============================================${NC}"
    
    INSTALL_GIT=false
    INSTALL_GCC=false
    INSTALL_CMAKE=false
    INSTALL_VSCODE=false
    INSTALL_PYTHON=false
    INSTALL_NODEJS=false

    ask_yn "Do you want to install Git (version control)?" && INSTALL_GIT=true
    ask_yn "Do you want to install GCC/Clang (C/C++ compilers)?" && INSTALL_GCC=true
    ask_yn "Do you want to install CMake (build system)?" && INSTALL_CMAKE=true
    ask_yn "Do you want to install VS Code (code editor)?" && INSTALL_VSCODE=true
    ask_yn "Do you want to install Python (with pip)?" && INSTALL_PYTHON=true
    ask_yn "Do you want to install Node.js (with npm)?" && INSTALL_NODEJS=true

    if [ "$INSTALL_GIT" = true ]; then
        info "Installing Git..."
        sudo dnf install -y git 
        checkfail
    fi

    if [ "$INSTALL_GCC" = true ]; then
        info "Installing GCC/Clang..."
        sudo dnf groupinstall -y "Development Tools"
        checkfail
    fi

    if [ "$INSTALL_CMAKE" = true ]; then
        info "Installing CMake..."
        sudo dnf install -y cmake
        checkfail
    fi

    if [ "$INSTALL_VSCODE" = true ]; then
        info "Installing VS Code..."
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
        sudo dnf install -y code
        checkfail
    fi

    if [ "$INSTALL_PYTHON" = true ]; then
        info "Installing Python and pip..."
        sudo dnf install -y python3 python3-pip 
        checkfail
    fi

    if [ "$INSTALL_NODEJS" = true ]; then
        info "Installing Node.js and npm..."
        sudo dnf install -y nodejs npm 
        checkfail
    fi
    presstocontinue
}

RebootSystem() {
    clear
    echo ""
    echo -e "${BOLD}${BLUE}==========================================================${NC}"
    echo -e "${BOLD}${BLUE}              REBOOT SYSTEM${NC}"
    echo -e "${BOLD}${BLUE}==========================================================${NC}"
    
    if ask_yn "Do you want to reboot your system now?"; then
        echo -e "${YELLOW}Rebooting in 5 seconds...${NC}"
        sleep 5
        sudo reboot
    else
        echo -e "${BLUE}You can reboot later using: sudo reboot${NC}"
        presstocontinue
    fi
}

show_menu() {
    clear
    echo -e "${BOLD}${BLUE}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLUE}║         🛠️  GEAR-UP - Fedora Setup Script           ║${NC}"
    echo -e "${BOLD}${BLUE}╚════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "  ${GREEN}1)${NC} 🌐 Internet Tools (Telegram, FreeTube, discord)"
    echo -e "  ${GREEN}2)${NC} 🎮 Gaming Platforms (Steam, Lutris, Heroic, Protonup)"
    echo -e "  ${GREEN}3)${NC} ⚡ Gaming Optimizations (Gamemode, MangoHud, btop)"
    echo -e "  ${GREEN}4)${NC} 🛠️  Development Tools (Git, GCC, VS Code, Python, Node)"
    echo -e "  ${GREEN}5)${NC} 🟢 ASUS Laptop Tools (asusctl + ROG Center)"
    echo -e "  ${GREEN}6)${NC} 🎬 Hardware Codecs & NVIDIA Drivers"
    echo -e "  ${GREEN}7)${NC} 📊 Office (Libre Office, Only Office)"
    echo -e "  ${GREEN}8)${NC} ✂️  Editing(Blender, Kdenlive, shotcut, Gimp)"
    echo -e "  ${GREEN}9)${NC} 🔄 Reboot System"
    echo -e "  ${RED}0)${NC} 🚪 Exit"
    echo ""
    echo -e "${BLUE}════════════════════════════════════════════════════${NC}"
}

clear
echo -e "${BOLD}${BLUE}============================================${NC}"
echo -e "${BOLD}${BLUE}            🔄 SYSTEM UPDATE${NC}"
echo -e "${BOLD}${BLUE}============================================${NC}"
info "Updating package lists..."
sudo dnf update -y && success "System updated"
info "Adding RPM Fusion repositories..."
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
info "Adding Flathub repository..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

info "Installing Flatpak..."
sudo dnf install -y flatpak && success "Flatpak installed"
info "Upgrading all packages..."
sudo dnf update -y && success "System Updated"
presstocontinue


while true; do
    show_menu
    choice=$(read_choice 0 9)
    
    case $choice in
        1) Internet ;;
        2) GamingPlatforms ;;
        3) GameGearUP ;;
        4) DevelopmentTools ;;
        5) AsusToolsInstall ;;
        6) 
            NvidiaInstall
            installcodec
            ;;
        7) Office;;
        8) Editing;;
        9) RebootSystem ;;
        0) 
            clear
            echo -e "${GREEN}Thank you for using GEAR-UP! 🚀${NC}"
            echo -e "${GREEN}Exiting...${NC}"
            exit 0
            ;;
    esac
done
