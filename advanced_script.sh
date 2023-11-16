#!/bin/bash

while true; do

    answers=()

    while read line; do
        answers+=( "$line" )
    done < answers.txt

    echo -e "\nValitse yksi vaihtoehdoista (kirjoita vaihtoehdon numero)."
    echo -e "(1) Suorita ohjelma\n(2) Näytä vastaukset\n(3) Muuta vastauksia\n(4) Lopeta ohjelma"
    read option

    if [ $option -eq 1 ]; then
        echo "Oletko mies vai nainen?"
        read sex
        echo "Syötä ikä 0 - 100"
        read age
        echo ""
        
        if [[ $sex == "mies" || $sex == "m" ]]; then
            if [[( $age -ge 0 ) && ( $age -lt 13 )]]; then
                echo "${answers[0]}"
            elif [[ $age -ge 13 && $age -lt 18 ]]; then
                echo "${answers[1]}"
            elif [[ $age -ge 18 && $age -lt 30 ]]; then
                echo "${answers[2]}"
            elif [[ $age -ge 30 && $age -lt 60 ]]; then
                echo "${answers[3]}"
            elif [ $age -ge 60 ]; then
                echo "${answers[4]}"
            else 
                echo "Virheellinen ikä!"
            fi
        
        elif [[ $sex = "nainen" || $sex = "n" ]]; then
            if [[ $age -ge 0 && $age -lt 13 ]]; then
                echo "${answers[5]}"
            elif [[ $age -ge 13 && $age -lt 18 ]]; then
                echo "${answers[6]}"
            elif [[ $age -ge 18 && $age -lt 30 ]]; then
                echo "${answers[7]}"
            elif [[ $age -ge 30 && $age -lt 60 ]]; then
                echo "${answers[8]}"
            elif [ $age -ge 60 ]; then
                echo "${answers[9]}"
            else
                echo "Virheellinen ikä!"
            fi
        else
            echo -e "\nVirheellinen sukupuolen valinta!\n"
        fi

    elif [ $option -eq 2 ]; then
        echo -e "\nVastaukset:"
        for line in "${!answers[@]}"; do
            echo "$line" "${answers[$line]}"
        done

    elif [ $option -eq 3 ]; then
        echo -e "\nVastaukset:"
        for line in "${!answers[@]}"; do
            echo "$line" "${answers[$line]}"
        done

        echo -e "\nKirjoita vastauksen numero, jota haluat muuttaa."
        read number

        echo -e "\nKirjoita uusi vastaus."
        read new_aswer

        sed -i "s/${answers[$number]}/$new_aswer/" answers.txt

    elif [ $option -eq 4 ]; then
        break

    else
        echo -e "\nVirheellinen valinta!\n"
    fi
done

