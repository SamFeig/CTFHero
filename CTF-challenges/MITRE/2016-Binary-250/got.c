//------------------------------------------
//      GOT Hijack - Who is the best GoT character?!
//      MITRE CTF 2016
//
//      Compilation:
//              gcc GOT.c -o GoT
//
//      Usage:
//              ./GoT <Game_of_Thrones_Char_1> <Game_of_Thrones_Char_2>
//              NOTE: First names only
//
//      contact: apellitieri@mitre.org
//------------------------------------------



#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct entry {
    char *str;
    int n;
};
// Accepts first names, power totals calculated with FOUO proprietary algorithms
struct entry dict[] = {
    "Jon", 9999,
    "Daenerys", 910,
    "Gregor", 61,
    "Arya", 999,
    "Melisandre", 26,
    "Cersei", 98,
    "Sansa", 3,
    "Ramsay", 63,
    "Margaery", 50,
    "Sandor", 99,
    "Gendry", 7,
    "Eddard", -2,
    "Petyr", 80,
    "Hodor", 1000000,
    "Catelyn", -4,
    "Tyrion", 920,
    "Shae", 54,
    "Joffery", -90203,
    "Varys", 444,
    "Bran", 999,
    "Brienne", 999,
    "Tormund", 891,
    "Ygritte", 4,
    "Theon", 4,
    "Robb", -100,
    "Stannis", -1000,
    "Jaime", 997,
    "Sam", -1,
    "Samwell", -1,
    0,0
};

int calculate_power(char* name_for_calc,char* input){

        int power_lvl = 0;

        strcpy(name_for_calc, input);
        printf("Calculating power for %s...\n", name_for_calc);

        int i = 0;
        char *key = dict[i].str;
        while(key){
                if(strcmp(name_for_calc,key) == 0){
                        return dict[i].n;
                }
                key = dict[++i].str;
        }

        // Return 0 if name not found in GoT db
        return power_lvl;
}

int main(int argc, char* argv[]){

        // Output proper usage
        if(argc != 3){
                printf("You know nothing Jon Snow..\n\nUsage:\n\t./GoT <Game_of_Thrones_Char_First_Name> <Game_of_Thrones_Char_2>\n\tEx: ./GoT Daenerys Cersei\n\tDaenerys wins! (obviously)\n");
                exit(1);
        }

        // Initialize name storage and other variables
        char* character_ptr = NULL;
        char character_name_storage[10];
        character_ptr = character_name_storage;

        int first_pwr_lvl = 0;
        int second_pwr_lvl = 0;

        // Calculate character power levels
        first_pwr_lvl = calculate_power(character_ptr, argv[1]);
        second_pwr_lvl = calculate_power(character_ptr, argv[2]);

        //Calculate and output the victor
        if(first_pwr_lvl == second_pwr_lvl){
                printf("This match is too even to decide. Both characters are equally awesome (or terrible)..\n");
        }
        else if(first_pwr_lvl > second_pwr_lvl){
                printf("The winner is %s! (obviously)\n", argv[1]);
        }
        else{
                printf("The clear winner is %s! (obviously)\n", argv[2]);
        }

        return 0;
}

