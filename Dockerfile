FROM python:3.6-slim

RUN apt-get update && apt-get install -y build-essential zsh git \
    && apt-get install -y bash-completion

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/themes/powerlevel10k
RUN echo 'source /root/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme' >> /root/.zshrc

# Install zsh-syntax-highlighting plugin
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
RUN echo 'source /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> /root/.zshrc

# Install zsh-autosuggestions plugin
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN echo 'source /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> /root/.zshrc

# Configure Zsh for autocompletion
RUN echo "autoload -U compinit && compinit" >> /root/.zshrc
RUN echo "autoload -U bashcompinit && bashcompinit" >> /root/.zshrc

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["zsh"]
