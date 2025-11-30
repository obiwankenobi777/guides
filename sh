RESERVED WORD

if then elif else fi
for in do done
while
case esac
until
continue
break
select
function
coproc
time
{}
[[ ]]
!

ARITHMETIC OPERATORS
-eq equal
-ne not equal
-lt less than
-gt greater than
-le less equal
-ge greater equal

[[ ]] && [[ ]] #AND
[[ ]] || [[ ]] #OR

STRINGS EXPRESSIONS
-v  varName if the shell variable varName is set
-z  if the length of the string zero
-n  if the length of the string is non-zero

STRINGS COMPARISONS
=   equal
[[ "${str1}" == "${str2}"]]

!<  not equal
[[ "${str1}" != "${str2}"]]

<   less than
[[ "${str1}" < "${str2}"]]

>   greater than
[[ "${str1}" > "${str2}"]]

FILE TESTS
-a  if file exists #obsoleto
-b  if file exists and is a block special file
-c  if file exists and is a character special file
-d  if file exists and is a directory
-e  if file or directory exists
-f  if is a regular file
-h  if file exists and is a symbolic link
-r  if file exists and is readable
-s  if file exists and has a size greater than zero
-w  if file exists and is a writable
-x  if file exists and is executable
-L  if file exists and is a symbolic link

EXIT STATUS OPERATOR
[[ $? -eq 0 ]]  -> returns true if the command was successful without any
errors
[[ $? -gt 0 ]] -> return true if the command was not successful or had errors

COMMAND LINE PARAMATERS
$@ -> all arguments
$# -> number of parameters passed on the command line
${@:2} -> from second to last
${@:3} -> from the third to last
${@:2:$(($#-2))} -> from second to last

COMMAND -> DECLARE
declare [options] name=value

-i -> int
-a -> array
-A -> array associativo
-r -> only read
-x -> export
-p -> exibe variáveis e seus atributos

Array associativo em bash
declare -A arr
arr["name"]="elliot alderson"
arr["age"]=77
arr["distro"]="archlinux"

show::arr
for key "${!arr[@]}"; do
    echo "$key: ${arr[$key]}"
done

Percorrer os valores
for value in "${arr[@]}"; do
    echo "$value"
done

#Arrays associativos não tem ordem garantida
#Se precisar de ordem, você mesmo deve ordenar as chaves

for k in $(printf "%s\n" "${!arr[@]}" | sort); do
    echo "$k = ${arr[$k]}"
done


declare -p arr

echo "${arr["name"]}"
echo "${arr["age"]}"
echo "${arr["distro"]}"

Remover um item do array associtivo
unset arr["name"]
---------------------------------
until [[ your conditons ]]; do
    ...
done

count=1
until [[ $count -gt 10 ]]; do
    echo -n "$count, "
done
---------------------------------
case "word" in
	pattern1)
		todo1
		;;
	pattern2)
		todo2
		;;
	pattern3|pattern4)
		todo3,4
		;;
	*)
		todo
		;;
esac
---------------------------------
list=(arch lfs gentoo freebsd)

for i in "{list[*]}"; do echo "$i"; done
>> arch lfs gentoo freebsd

for i in "${list[@]}"; do echo "$i"; done
>> arch
lfs 
gentoo
freebsd

for i in ${list[*]}; do echo "$i"; done ==
for i in ${list[@]}; do echo "$i"; done
>> arch
debian
lfs
gentoo

O comando abaixo printa no terminal o tamanho de list
echo "${#list[@]}"
list[@] -> representa todos os elementos de list
# antes de list[@] -> informa o número de elementos de list

Este comando informa o tamanho do primeiro elementod de list
echo "${#echo[0]}"

main() {
	arr=(arch gentoo freebsd openbsd lfs);
	i=0
	while (( i < ${#arr[@]} )); do
	echo "${arr[i]} -> ${#arr[i]}"
	((i++))
	done
}
.......................................................

COLORS (FOREGROUND)
Preto     | 30
Vermelho  | 31
Verde     | 32
Amarelo   | 33
Azul      | 34
Magenta   | 35
Ciano     | 36
Branco    | 37

COLORS (BACKGROUND)
Preto       | 40
Vermelho    | 41
Verde       | 42
Amarelo     | 43
Azul        | 44
Magenta     | 45
Ciano       | 46
Branco      | 47

STYLE
Resetar tudo        | 0
Negrito (bold)      | 1
Substituir fraco    | 2
Itálico             | 3
Sublinhado          | 4
Piscando            | 5
Inverter cores      | 7

EXEMPLAS
echo -e "\033[31mTexto vermelho\033[0m"
echo -e "\033[1;34mTexto azul em negrito\033[0m"
echo -e "\033[42;30mTexto preto com fundo verde\033[0m"

\033[<estilo>;<cor>mTexto\033[0m

.......................................................

ctrl + k -> delete everything from the cursor to the end of the line
ctrl + u -> delete everything from the cursor to the start of the line
ctrl + w -> delete one word backward from cursor
ctrl + r -> search you history backward. this is probably the one that i use
the most. it is really handy and speeds up my work-flow a lot
ctrl + l -> clear the screnn
ctrl + s -> stops the output to the screen 

---------------------------------
Aqui está um guia conciso de **melhores práticas para scripting em Bash**, 
com foco em robustez, legibilidade e manutenção. Essas práticas ajudam a 
criar scripts confiáveis e fáceis de entender:

---

### 1. **Use Shebang Apropriado**
- Sempre comece o script com a linha shebang para especificar o interpretador.
- Use `#!/bin/bash` para Bash ou `#!/usr/bin/env bash` para maior portabilidade 
(encontra o Bash no PATH).

  ```bash
  #!/usr/bin/env bash
  ```

---

### 2. **Habilite Modos de Segurança**
- Use opções do Bash para evitar comportamentos inesperados:
  - `set -e`: Sai imediatamente se um comando falhar.
  - `set -u`: Trata variáveis não definidas como erro.
  - `set -o pipefail`: Garante que pipelines falhem se qualquer comando no pipeline falhar.
  ```bash
  set -euo pipefail
  ```

---

### 3. **Use `[[` em Vez de `[` para Testes**
- Prefira `[[` para condições, pois é mais seguro, suporta operadores avançados 
(como `=~` para regex) e não exige citar variáveis.

  ```bash
  if [[ $var == "teste" ]]; then
      echo "Correto"
  fi
  ```
- Use `[` apenas para compatibilidade POSIX.

---

### 4. **Cite Variáveis e Expansões**
- Sempre cite variáveis (`"$var"`) para evitar erros quando estão vazias ou não definidas.
  ```bash
  if [[ -z "$var" ]]; then
      echo "Variável vazia"
  fi
  ```
- Exceção: Dentro de `[[`, citar não é necessário, mas ainda é boa prática para consistência.

---

### 5. **Evite Variáveis Globais Desnecessárias**
- Prefira variáveis locais dentro de funções com `local` ou `declare` para evitar 
poluição do escopo global.

  ```bash
  my_function() {
      local var="valor"
      echo "$var"
  }
  ```

---

### 6. **Escreva Funções para Código Reutilizável**
- Organize o código em funções para modularidade e reutilização.
- Use nomes descritivos e retorne códigos de saída claros.
  ```bash
  check_file() {
      local file="$1"
      [[ -f "$file" ]] && return 0 || return 1
  }
  ```

---

### 7. **Valide Entrada do Usuário**
- Sempre valide argumentos e entradas para evitar erros ou comportamento inesperado.
  ```bash
  if [[ $# -ne 1 ]]; then
      echo "Uso: $0 <arquivo>"
      exit 1
  fi
  ```

---

### 8. **Use Mensagens de Erro Claras**
- Redirecione mensagens de erro para `stderr` com `>&2`.
- Forneça mensagens descritivas para ajudar na depuração.
  ```bash
  echo "Erro: Arquivo não encontrado" >&2
  exit 1
  ```

---

### 9. **Evite `eval` e Use Alternativas Seguras**
- O comando `eval` é perigoso, pois executa strings como código e 
pode introduzir vulnerabilidades.

- Use arrays ou expansões de parâmetros em vez disso.
  ```bash
  # Ruim
  eval "var=$value"

  # Bom
  declare -A my_array
  my_array["key"]="$value"
  ```

---

### 10. **Use Arrays para Listas**
- Para lidar com listas ou strings com espaços, use arrays em vez de variáveis simples.
  ```bash
  files=("file1.txt" "file2.txt")
  for file in "${files[@]}"; do
      echo "Processando $file"
  done
  ```

---

### 11. **Prefira Ferramentas Modernas**
- Evite comandos obsoletos como `echo` para saídas complexas (use `printf`) ou `grep`/`sed` para manipulações avançadas (considere `awk` ou ferramentas específicas).
  ```bash
  printf "Valor: %s\n" "$var"
  ```

---

### 12. **Adote um Estilo de Código Consistente**
- Use indentação (2 ou 4 espaços) e nomes de variáveis/funções claros.
- Comente o código para explicar lógica complexa, mas evite comentários óbvios.
  ```bash
  # Verifica se o diretório existe antes de criar arquivos
  if [[ ! -d "$output_dir" ]]; then
      mkdir -p "$output_dir"
  fi
  ```

---

### 13. **Teste e Depure Scripts**
- Use `bash -n script.sh` para verificar sintaxe sem executar.
- Use `bash -x script.sh` para depurar, mostrando comandos executados.
- Teste com casos extremos (variáveis vazias, permissões negadas, etc.).

---

### 14. **Evite Dependências Desnecessárias**
- Prefira comandos embutidos do Bash ou ferramentas padrão (como `grep`, `awk`) em vez de instalar pacotes adicionais.
- Para scripts portáteis, siga o padrão POSIX e evite extensões específicas do Bash.

---

### 15. **Documente o Script**
- Inclua um cabeçalho com propósito, uso e dependências.
  ```bash
  #!/usr/bin/env bash
  # Descrição: Script para processar arquivos de log
  # Uso: ./script.sh <diretório>
  # Dependências: grep, awk
  ```

---

### 16. **Controle Saídas de Comandos**
- Redirecione saídas desnecessárias para `/dev/null` para reduzir ruído.
  ```bash
  rm "$file" 2>/dev/null || echo "Falha ao remover $file" >&2
  ```

---

### 17. **Use Trap para Lidar com Erros ou Interrupções**
- Configure `trap` para limpar recursos (como arquivos temporários) ou lidar com sinais (Ctrl+C).
  ```bash
  trap 'rm -f /tmp/tempfile; echo "Script interrompido" >&2; exit 1' INT TERM EXIT
  ```

---

### 18. **Considere Alternativas para Scripts Complexos**
- Se o script ficar muito complexo, avalie usar linguagens como Python ou Perl,
que oferecem melhor manipulação de erros e estruturas de dados.

---

### Exemplo de Script Seguindo Boas Práticas
```bash
#!/usr/bin/env bash
set -euo pipefail

# Descrição: Copia arquivos .txt para um diretório de backup
# Uso: ./backup.sh <diretório_fonte> <diretório_destino>

# Valida argumentos
if [[ $# -ne 2 ]]; then
    echo "Uso: $0 <diretório_fonte> <diretório_destino>" >&2
    exit 1
fi

source_dir="$1"
backup_dir="$2"

# Verifica se os diretórios existem
if [[ ! -d "$source_dir" ]]; then
    echo "Erro: Diretório fonte '$source_dir' não existe" >&2
    exit 1
fi

mkdir -p "$backup_dir" || {
    echo "Erro: Falha ao criar '$backup_dir'" >&2
    exit 1
}

# Função para copiar arquivos
copy_files() {
    local src="$1" dst="$2"
    for file in "$src"/*.txt; do
        if [[ -f "$file" ]]; then
            cp "$file" "$dst" && echo "Copiado: $file" || {
                echo "Erro ao copiar $file" >&2
                return 1
            }
        fi
    done
}

# Executa a cópia
copy_files "$source_dir" "$backup_dir"
```

---

### Resumo
- **Segurança**: Use `set -euo pipefail`, cite variáveis, valide entradas.
- **Legibilidade**: Adote funções, comentários úteis, indentação consistente.
- **Robustez**: Teste condições com `[[`, gerencie erros, use `trap`.
- **Manutenção**: Documente, evite dependências desnecessárias, prefira modularidade.

Seguindo essas práticas, seus scripts Bash serão mais confiáveis, fáceis de manter 
e menos propensos a erros.

