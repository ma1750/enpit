From hisazumi/aprisrc-sitl:latest

# add VS Code
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
    && install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ \
    && sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
    && apt-get install -y apt-transport-https \
    && apt-get update \
    && apt-get install -y code
RUN echo "[Desktop Entry]" >> $HOME/Desktop/code.desktop \
    && echo "Type=Link" >> $HOME/Desktop/code.desktop \
    && echo "Name=Visual Studio Code" >> $HOME/Desktop/code.desktop \
    && echo "Icon=com.visualstudio.code" >> $HOME/Desktop/code.desktop \
    && echo "URL=/usr/share/applications/code.desktop" >> $HOME/Desktop/code.desktop
