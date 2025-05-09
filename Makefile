# Makefile para um projeto Rust usando Cargo

# Nome do seu projeto (pode precisar ser ajustado)
PROJETO_NOME := adivinha_numero

# Caminho de instalação
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
GAMESDIR ?= /usr/games  # Diretório para jogos

# Comando do Cargo
CARGO := cargo

# Alvos

all: build  # 'all' é o alvo padrão, então apenas 'make' fará o build

build:
	@echo "Construindo o projeto em modo release..."
	@$(CARGO) build --release
	@echo "Build concluído!"

install: build
	@echo "Instalando o executável em $(GAMESDIR)..."
	@sudo mkdir -p $(GAMESDIR) # Garante que o diretório existe
	@sudo cp target/release/adivinha_numero /usr/games # Instala o executável no diretório correto
	@echo "Instalação concluída em $(GAMESDIR)!"

run:
	@echo "Rodando o programa..."
	@$(GAMESDIR)/$(PROJETO_NOME) # Executa do diretório de instalação
	@echo "Programa executado."

clean:
	@echo "Limpando o projeto..."
	@$(CARGO) clean
	@echo "Limpeza concluída!"

.PHONY: all build install run clean  # Declara os alvos como 'phony'

# Explicação:
# 1. PROJETO_NOME: Define o nome do seu projeto.  Você DEVE ajustar isso.
# 2. PREFIX, BINDIR, GAMESDIR: Define os caminhos de instalação.
# 3. CARGO: Simplifica o uso do comando `cargo`.
# 4. all: Constrói o projeto (modo release).
# 5. build: Executa `cargo build --release`.
# 6. install: Instala o executável no diretório `/usr/games`.
# 7. run: Executa o programa instalado.
# 8. clean: Limpa o projeto usando `cargo clean`.
# 9. .PHONY: Declara os alvos como 'phony' (não representam arquivos reais).
