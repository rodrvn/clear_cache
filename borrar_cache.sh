#!/bin/bash

# Función para borrar la caché de Visual Studio Code
clear_vscode_cache() {
    echo "##### Cerrando sesiones de Visual Studio Code... #####"
    pkill -o -e -x "code"
    echo "##### Sesiones de Visual Studio Code cerradas. #####"
    
    sleep 1
    
    echo "##### Borrando la caché de Visual Studio Code... #####"
    rm -rf "$HOME/.config/Code/Cache"
    rm -rf "$HOME/.config/Code/CachedData"
    echo "##### Caché de Visual Studio Code borrada. #####"
}

# Función para borrar la caché de Firefox
clear_firefox_cache() {
    echo "##### Borrando la caché de Firefox... #####"
    rm -rf "$HOME/.cache/mozilla/firefox"
    echo "##### Caché de Firefox borrada. #####"
}

# Función para borrar la caché de Git
clear_git_cache() {
    echo "##### Cerrando Git... #####"
    pkill -o -e -x "git"
    echo "##### Git cerrado. #####"
    
    echo "##### Cerrando sesión de GitHub en la PC... #####"
    git credential-cache exit
    git config --global --unset credential.helper
    echo "##### Sesión de GitHub cerrada en la PC. #####"
    
    sleep 1
    
    echo "##### Borrando la caché de Git... #####"
    git gc --prune=now
    echo "##### Caché de Git borrada. #####"
}

# Función para borrar las carpetas del escritorio
clear_desktop_folders() {
    echo "##### Borrando carpetas del escritorio... #####"
    rm -rf "$HOME/Escritorio"/*
    echo "##### Carpetas del escritorio borradas. #####"
}

# Función para borrar la papelera de reciclaje
clear_trash() {
    echo "##### Borrando la papelera de reciclaje... #####"
    rm -rf "$HOME/.local/share/Trash/files"/*
    echo "##### Papelera de reciclaje vaciada. #####"
}

# Función para borrar la caché del buscador Brave
clear_brave_cache() {
    echo "##### Borrando la caché del buscador Brave... #####"
    rm -rf "$HOME/.cache/BraveSoftware/Brave-Browser"
    echo "##### Caché del buscador Brave borrada. #####"
}

# Función para borrar la caché del buscador Chromium
clear_chromium_cache() {
    echo "##### Borrando la caché del buscador Chromium... #####"
    rm -rf "$HOME/.cache/chromium"
    echo "##### Caché del buscador Chromium borrada. #####"
}

# Función para borrar los datos de Discord
clear_discord_data() {
    # Cierra sesion discord
    discord logout
    echo "##### Sesion de discord cerrada. #####"
    
    sleep 1
    
    echo "##### Borrando los datos de Discord... #####"
    rm -rf "$HOME/.config/discord"
}

# Función para cerrar las sesiones de Gmail y Outlook en navegadores web
clear_web_sessions() {
    echo "##### Cerrando sesiones en navegadores web... #####"

    # Cierra la sesiones en Chrome
    pkill -o -i -e -x "chrome" --args --new-profile-avatar-name=Default

    # Cierra las sesiones en firefox
    pkill -o -i -e -x "firefox" --private-window
    
    # Cierra sesiones de brave
    pkill -o -i -e -x "brave"

    #En el caso de querer borrar de otros navegadores hacerlo aqui

    echo "##### Sesiones en navegadores cerradas. #####"
}

# Función para borrar las contraseñas guardadas en navegadores web (para Chrome, Brave y Firefox)
clear_saved_passwords() {
    echo "##### Borrando contraseñas guardadas en navegadores web... #####"

    # Ruta donde se encuentra el archivo de contraseñas de Chrome
    chrome_password_file="$HOME/.config/google-chrome/Default/Login Data"

    # Ruta donde se encuentra el archivo de contraseñas de Brave
    brave_password_file="$HOME/.config/BraveSoftware/Brave-Browser/Default/Login Data"

    # Ruta donde se encuentra el archivo de contraseñas de Firefox
    firefox_password_file="$HOME/.mozilla/firefox/*.default-release/logins.json"

    # Comprobar si los navegadores están cerrados antes de borrar contraseñas
    pkill -o -e -x "chrome"
    pkill -o -e -x "brave"
    pkill -o -e -x "firefox"
    sleep 2

    # Borrar los archivos de contraseñas de Chrome, Brave y Firefox
    rm "$chrome_password_file"
    rm "$brave_password_file"
    rm "$firefox_password_file"

    echo "##### Contraseñas guardadas en navegadores web borradas. #####"
}

# Función para borrar la carpeta de imágenes
clear_images_folder() {
    echo "##### Borrando la carpeta de imágenes... #####"
    rm -rf "$HOME/Imágenes"/*
    echo "##### Carpeta de imágenes borrada. #####"
}

# Función para borrar la carpeta de videos
clear_videos_folder() {
    echo "##### Borrando la carpeta de videos... #####"
    rm -rf "$HOME/Vídeos"/*
    echo "##### Carpeta de videos borrada. #####"
}

# Función para borrar la carpeta de descargas
clear_downloads_folder() {
    echo "##### Borrando la carpeta de descargas... #####"
    rm -rf "$HOME/Descargas"/*
    echo "##### Carpeta de descargas borrada. #####"
}

# Función para borrar la carpeta de documentos
clear_downloads_folder() {
    echo "##### Borrando la carpeta de documentos... #####"
    rm -rf "$HOME/Documentos"/*
    echo "##### Carpeta de Documentos borrada. #####"
}

# Otorgar permisos de ejecución al script
chmod +x "$0"

# Llamar a las funciones para borrar la caché y las carpetas del escritorio
clear_vscode_cache
clear_firefox_cache
clear_git_cache
clear_desktop_folders
clear_downloads_folder
clear_videos_folder
clear_images_folder

# Llamar a las funciones adicionales
clear_trash
clear_brave_cache
clear_chromium_cache
clear_discord_data

# Llamar a las funciones para cerrar sesiones y borrar contraseñas
clear_web_sessions
clear_saved_passwords

echo "##### Limpieza completada, listo para el bootcamp :) #####"
sleep 3
