#!/data/data/com.termux/files/usr/bin/bash

# Author Bayu Rizky A.M
# Youtube : Pejuang kentang
# Program : desimal to biner


# depencies
exec 7<>/dev/null
{
	de_install=("bc" "ncurses-utils" "ossp-uid")

	for install_de in "${de_install[@]}"; do
		apt-get install "$install_de" -y
	done
} >&7 2>&7

# framework bash

source lib/moduler.sh

Namespace Std :: Sys;{
	{ Bash.import: colorsh/ink; }
	{ Bash.import: log/warnings; };{ const: __warn__ =\> log; }
	{ Bash.import: feature/io.echo; };{ const: __io__ =\> say; }
}

: @Desimal to biner

# oop system
class __convert__;{ input="" result=""; };{
	{
		public: app =\> [hitung]
		public: app =\> [main]
	}

	public __convert__::hitung(){
		input="$@"
		if [[ -z "$input" ]]; then { log.info "input harus berupa angka atau tidak boleh kosong"; exit; }; fi

		rumus="obase=2;$input"
		regexp="s/\.//g"

		{ bc <<< "$rumus"|sed "$regexp" 2>&7; } || { log.info "input harus berupa angka atau tidak boleh kosong";exit; }
	}

	public __convert__::main(){
		cat <<< "
	----------------------------
	[+] Author : Bayu Rizky A.M
	[+] Youtub : Pejuang Kentang
	----------------------------

	[?] follow github Bayu12345677
	[#] gunakan angka desimal misal 0.738 dan bisa anda kombinasikan dengan
	[#] operator mati matika semisal 0.213^1 atau 0.263*2
		"
	echo
	io.write "masukan input : "; read dt

	# animasi
	for x in {1..5}; do
		array=("." ".." "..." "...." "..." "..")
		let long=(${#array[3]} + 1)

		for runtime in "${array[@]}"; do
			tput sc
			io.write "[+] Mengconversikan $dt %-${long}s biner" "$runtime"
			tput rc
			sleep 0.1
		done
	done

	tput dl1 ed
	echo
	io.write "hasil dari $dt -> %s\n" $(__convert__::hitung "$dt")
	}
}

const: __convert__ =\> c

{ tput init && tput clear; }; c.main
