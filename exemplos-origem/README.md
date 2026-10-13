# Exemplos de Código-Fonte em Elixir

Esta pasta contém exemplos de código-fonte desenvolvidos na linguagem **Elixir**, para a disciplina de Compiladores e Paradigmas de Programação. Os exemplos demonstram conceitos fundamentais da linguagem, como tipos de dados, estruturas de controle, funções e subprogramas.

## 1. Linguagem e ambiente utilizados

- **Linguagem:** Elixir
- **Versão utilizada:** Elixir 1.20.4
- **Ambiente de execução:** Erlang/OTP (máquina virtual BEAM)
- **Sistemas operacionais:** Windows e Linux
- **Extensão dos arquivos:** `.exs`

## 2. Instalação do Elixir

Para executar os exemplos, é necessário instalar o Elixir e o Erlang/OTP. Dependendo do método de instalação, o Erlang/OTP pode ser instalado automaticamente como dependência ou precisar de instalação separada.

### 2.1. Windows

**Passo 1 — Baixar e instalar**

O Elixir necessita da máquina virtual do Erlang/OTP para ser executado. Acesse os sites oficiais de instalação para realizar o download:

- **Erlang/OTP (Download do executável):** https://www.erlang.org/downloads.html
- **Elixir (Instalador oficial):** https://elixir-lang.org/install.html

Instale primeiro o Erlang/OTP e, em seguida, o Elixir. Alternativamente, você pode instalar diretamente pelo PowerShell executando:

```powershell
winget install Elixir.Elixir
```

**Passo 2 — Verificar a instalação**

Após concluir a instalação, abra o PowerShell ou o Prompt de Comando e execute:

```powershell
elixir --version
```

Se a instalação estiver correta, serão exibidas as versões instaladas do Elixir e do Erlang/OTP.

Caso o comando não seja reconhecido, verifique se os diretórios necessários foram adicionados à variável de ambiente `PATH`.

### 2.2. Linux

Para instalar a versão mais recente do Erlang e do Elixir.

**Passo 1 — Instalar as dependências do sistema e o gerenciador `mise`**
```bash
sudo apt update && sudo apt install -y curl git build-essential
curl https://mise.run | sh
```

**Passo 2 — Instalar as versões mais recentes do Erlang e Elixir**
```bash
mise use --global erlang@latest
mise use --global elixir@latest
```

**Passo 3 — Confirmar a instalação**
```bash
elixir --version
```

## 3. Como executar os exemplos

Os arquivos desta pasta possuem a extensão `.exs`, utilizada para scripts Elixir.

**Passo 1 — Abrir o terminal na pasta**

Acesse o diretório `exemplos-origem` do projeto. Substitua o caminho abaixo pelo local em que o repositório estiver salvo:

```bash
cd caminho/para/exemplos-origem
```

**Passo 2 — Executar um arquivo**

Utilize o comando `elixir`, seguido do nome do arquivo:

```bash
elixir 01_tipos_basicos.exs
```

Para executar outro exemplo:

```bash
elixir 02_tipos_compostos.exs
```
Caso o programa solicite informações, digite os dados no terminal e pressione `Enter`.

## 4. Compilação e execução

Os exemplos foram desenvolvidos como scripts `.exs`, executados diretamente pelo comando `elixir`. Dessa forma, não é necessário gerar previamente um arquivo executável independente.

Durante a execução, o Elixir compila o código conforme necessário para executá-lo na máquina virtual BEAM.

## 5. Observações

- Os arquivos são independentes e podem ser executados individualmente.
- Os comandos devem ser executados a partir do diretório em que os arquivos estão localizados ou utilizando o caminho completo do arquivo.
- Alguns programas solicitam entradas do usuário pelo terminal.
- É necessário ter o Elixir e o Erlang/OTP instalados corretamente antes de executar os exemplos.
- Os comandos de execução são iguais no Windows e no Linux; o procedimento de instalação pode variar conforme o sistema operacional e a versão desejada.

## 6. Referências oficiais

- [Site oficial do Elixir](https://elixir-lang.org/)
- [Guia de instalação do Elixir](https://elixir-lang.org/install.html)
- [Documentação oficial do Elixir](https://hexdocs.pm/elixir/)