#!/bin/bash
yellow=`tput setaf 3`
blue=`tput setaf 4`
red=`tput setaf 1`
cyan=`tput setaf 6`
magenta=`tput setaf 5`
reset=`tput sgr0`

drawLine (){
    for (( i=1; i<=40; i++ ))
    do  
        printf "-"
    done
}

removeExist (){
    cd $1 && rm -rf beginnerGit.sh .git_engine && cd ..
}

installNew (){
    cd $1
    git clone https://github.com/nishgt/automatic-nishgt
    cd automatic-nishgt && rm -rf LICENSE .gitignore .git && cp -R ./ ..
    cd .. && rm -rf automatic-nishgt && cd ..
}

updateThis (){
    cd $1 && git pull && cd ..
}

clearBaby (){
    sleep 1 && clear
}

while [[ $BRANCHING != 1 && $BRANCHING != 2 && $BRANCHING != 3 && $BRANCHING != 4 ]]
do

clear
printf "${cyan}1. Automatic Nishgt Yazılımını Yükle/Güncelle\n2. Automatic Nishgt Yazılımını Kaldır\n3. Tüm Repoları Güncelle\n4. Tüm Repoları İndir\n$(drawLine)\n${reset}"
read -p "${yellow}Ne yapmak istiyorsun?:${reset}" BRANCHING
    
    if [[ $BRANCHING == 1 ]]; then
            clear

            printf "${yellow}Buraya kuruluyor: artworks...\n${reset}"
            removeExist artworks && installNew artworks && clear
            
            printf "${yellow}Buraya kuruluyor: nishgt-global...\n${reset}"
            removeExist nishgt-global && installNew nishgt-global && clear
            
            printf "${yellow}Buraya kuruluyor: nishgt-jobs...\n${reset}"
            removeExist nishgt-jobs && installNew nishgt-jobs && clear
            
            printf "${yellow}Buraya kuruluyor: nishgt-posts...\n${reset}"
            removeExist nishgt-posts && installNew nishgt-posts && clear

        elif [[ $BRANCHING == 2 ]]; then
            clear

            printf "${yellow}Buradan kaldırılıyor: artworks...${reset}"
            removeExist artworks && clearBaby

            printf "${yellow}Buradan kaldırılıyor: nishgt-global...${reset}"
            removeExist nishgt-global && clearBaby 

            printf "${yellow}Buradan kaldırılıyor: nishgt-jobs...${reset}"
            removeExist nishgt-jobs && clearBaby

            printf "${yellow}Buradan kaldırılıyor: nishgt-posts...${reset}"
            removeExist nishgt-posts && clearBaby

        elif [[ $BRANCHING == 3 ]]; then
            clear

            printf "${yellow}Güncelleniyor: artworks...\n${reset}"
            updateThis artworks && clearBaby

            printf "${yellow}Güncelleniyor: nishgt-global...\n${reset}"
            updateThis nishgt-global && clearBaby

            printf "${yellow}Güncelleniyor: nishgt-jobs...\n${reset}"
            updateThis nishgt-jobs && clearBaby
            
            printf "${yellow}Güncelleniyor: nishgt-posts...\n${reset}"
            updateThis nishgt-posts && clearBaby

        elif [[ $BRANCHING == 4 ]]; then
            clear

            printf "${yellow}İndiriliyor: artworks...\n${reset}"
            git clone https://github.com/nishgt/artworks

            printf "${yellow}İndiriliyor: nishgt-global...\n${reset}"
            git clone https://github.com/nishgt/nishgt-global

            printf "${yellow}İndiriliyor: nishgt-jobs...\n${reset}"
            git clone https://github.com/nishgt/nishgt-jobs
            
            printf "${yellow}İndiriliyor: nishgt-posts...\n${reset}"
            git clone https://github.com/nishgt/nishgt-posts
            
        else
            echo "Lütfen bir işlem seçin!" && clearBaby
    fi
done