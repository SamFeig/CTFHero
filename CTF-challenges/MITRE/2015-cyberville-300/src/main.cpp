#include <iostream>
#include <stdlib.h>
#include <time.h>

#include "level_1.h"
#include "level_2.h"

using namespace std;

void clear(){
	cout << string(50, '\n');

	cout << "   ________  __   ____    ____               __    _____    _    __" << endl;
  	cout << "  / __/ __ \\/ /  / __ \\  / __/_ _  ___ _____/ /_  / ___/___(_)__/ /" << endl;
 	cout << " _\\ \\/ /_/ / /__/ /_/ / _\\ \\/  ' \\/ _ `/ __/ __/ / (_ / __/ / _  /" << endl; 
	cout << "/___/\\____/____/\\____/ /___/_/_/_/\\_,_/_/  \\__/  \\___/_/ /_/\\_,_/" << endl; 
	cout << endl;
	cout << "-----------------------------------------------------------" << endl;
}

void sleep(unsigned int mseconds)
{
    clock_t goal = mseconds*1000 + clock();
    while (goal > clock());
}

void intro(){
	cout << string(50, '\n');
	sleep(700);
	cout << "Connecting to Matt's backdoor..." << endl;
	sleep(700);
	cout << "Bypassing security |>--| |--<|" << endl;
	sleep(2000);
	cout << "." << endl << "." << endl << "." << endl;
	sleep(1000);
	cout << "SUCCESS." << endl << "Probing SOLO network for entry points." << endl << endl;
	sleep(1500);
	cout << "\\\\11-4D\\" << endl;
	sleep(22);
	cout << "\\\\2-1B\\" << endl;
	sleep(22);
	cout << "\\\\327-T\\" << endl;
	sleep(22);
	cout << "\\\\4-LOM\\" << endl;
	sleep(22);
	cout << "\\\\8d8\\" << endl;
	sleep(22);
	cout << "\\\\8t88\\" << endl;
	sleep(22);
	cout << "\\\\99\\" << endl;
	sleep(22);
	cout << "\\\\Abeloth\\" << endl;
	sleep(22);
	cout << "\\\\Acros-Krik\\" << endl;
	sleep(22);
	cout << "\\\\King Adas\\" << endl;
	sleep(22);
	cout << "\\\\Ak-Rev\\" << endl;
	sleep(22);
	cout << "\\\\Stass Allie\\" << endl;
	sleep(22);
	cout << "\\\\Mas Amedda\\" << endl;
	sleep(22);
	cout << "\\\\Amee\\" << endl;
	sleep(22);
	cout << "\\\\Darth Andeddu\\" << endl;
	sleep(22);
	cout << "\\\\Nom Anor\\" << endl;
	sleep(22);
	cout << "\\\\Bail Antilles\\" << endl;
	sleep(22);
	cout << "\\\\Raymus Antilles\\" << endl;
	sleep(22);
	cout << "\\\\Queen Apailana\\" << endl;
	sleep(22);
	cout << "\\\\Passel Argente\\" << endl;
	sleep(22);
	cout << "\\\\Faro Argyus\\" << endl;
	sleep(22);
	cout << "\\\\Seti Ashgad\\" << endl;
	sleep(22);
	cout << "\\\\Attichitcuk\\" << endl;
	sleep(22);
	cout << "\\\\Tavion Axmis\\" << endl;
	sleep(22);
	cout << "\\\\Azrakel\\" << endl;
	sleep(22);
	cout << "\\\\Azzameen Family\\" << endl;
	sleep(22);
	cout << "\\\\B4-D4\\" << endl;
	sleep(22);
	cout << "\\\\Ponda Baba\\" << endl;
	sleep(22);
	cout << "\\\\Kitster Banai\\" << endl;
	sleep(22);
	cout << "\\\\Darth Bandon\\" << endl;
	sleep(22);
	cout << "\\\\Moradmin Bast\\" << endl;
	sleep(22);
	cout << "\\\\Beed\\" << endl;
	sleep(22);
	cout << "\\\\Garm Bel Iblis\\" << endl;
	sleep(22);
	cout << "\\\\Sio Bibble\\" << endl;
	sleep(22);
	cout << "\\\\Depa Billaba\\" << endl;
	sleep(22);
	cout << "\\\\Deliah Blue\\" << endl;
	sleep(22);
	cout << "\\\\Blue Max\\" << endl;
	sleep(22);
	cout << "\\\\Commander Bly\\" << endl;
	sleep(22);
	cout << "\\\\Bossk\\" << endl;
	sleep(22);
	cout << "\\\\Bollux\\" << endl;
	sleep(22);
	cout << "\\\\Lux Bonteri\\" << endl;
	sleep(22);
	cout << "\\\\Mina Bonteri\\" << endl;
	sleep(22);
	cout << "\\\\Borvo the Hutt\\" << endl;
	sleep(22);
	cout << "\\\\Empatojayos Brand\\" << endl;
	sleep(22);
	cout << "\\\\Malcor Brashin\\" << endl;
	sleep(22);
	cout << "\\\\Senator Bana Breemu\\" << endl;
	sleep(22);
	cout << "\\\\Noa Briqualon\\" << endl;
	sleep(22);
	cout << "\\\\Maris Brood\\" << endl;
	sleep(22);
	cout << "\\\\Sora Bulq\\" << endl;
	sleep(22);
	cout << "\\\\Yomin Carr\\" << endl;
	sleep(22);
	cout << "\\\\CB-99\\" << endl;
	sleep(22);
	cout << "\\\\Joruus C'baoth\\" << endl;
	sleep(22);
	cout << "\\\\Tycho Celchu\\" << endl;
	sleep(22);
	cout << "\\\\Kadlah Cha\\" << endl;
	sleep(22);
	cout << "\\\\Wyrpuuk Cha\\" << endl;
	sleep(22);
	cout << "\\\\Charal\\" << endl;
	sleep(22);
	cout << "\\\\Chine-kal\\" << endl;
	sleep(22);
	cout << "\\\\Chief Chirpa\\" << endl;
	sleep(22);
	cout << "\\\\Nas Choka\\" << endl;
	sleep(22);
	cout << "\\\\Shok Choka\\" << endl;
	sleep(22);
	cout << "\\\\Rush Clovis\\" << endl;
	sleep(22);
	cout << "\\\\Commander Cody\\" << endl;
	sleep(22);
	cout << "\\\\Darth Cognus\\" << endl;
	sleep(22);
	cout << "\\\\Captain Jeremoch Colton\\" << endl;
	sleep(22);
	cout << "\\\\General Airen Cracken\\" << endl;
	sleep(22);
	cout << "\\\\Cradossk\\" << endl;
	sleep(22);
	cout << "\\\\Salacious B. Crumb\\" << endl;
	sleep(22);
	cout << "\\\\Arvel Crynyd\\" << endl;
	sleep(22);
	cout << "\\\\Admiral Natasi Daala\\" << endl;
	sleep(22);
	cout << "\\\\Hego Damask\\" << endl;
	sleep(22);
	cout << "\\\\Joclad Danva\\" << endl;
	sleep(22);
	cout << "\\\\Biggs Darklighter\\" << endl;
	sleep(22);
	cout << "\\\\General Oro Dassyne\\" << endl;
	sleep(22);
	cout << "\\\\Gizor Delso\\" << endl;
	sleep(22);
	cout << "\\\\Dengar\\" << endl;
	sleep(22);
	cout << "\\\\Desann\\" << endl;
	sleep(22);
	cout << "\\\\Darth Desolous\\" << endl;
	sleep(22);
	cout << "\\\\D'harhan\\" << endl;
	sleep(22);
	cout << "\\\\Ima-Gun Di\\" << endl;
	sleep(22);
	cout << "\\\\Grand Moff Vilim Disra\\" << endl;
	sleep(22);
	cout << "\\\\Teneniel Djo\\" << endl;
	sleep(22);
	cout << "\\\\Lott Dod\\" << endl;
	sleep(22);
	cout << "\\\\Daultay Dofine\\" << endl;
	sleep(22);
	cout << "\\\\Commander Doom\\" << endl;
	sleep(22);
	cout << "\\\\Cin Drallig\\" << endl;
	sleep(22);
	cout << "\\\\Hiram Drayson\\" << endl;
	sleep(22);
	cout << "\\\\Droidbait CT-00-2010\\" << endl;
	sleep(22);
	cout << "\\\\Grand Moff Dunhausen\\" << endl;
	sleep(22);
	cout << "\\\\Captain Dunwell\\" << endl;
	sleep(22);
	cout << "\\\\Lok Durd\\" << endl;
	sleep(22);
	cout << "\\\\Kyp Durron\\" << endl;
	sleep(22);
	cout << "\\\\Bant Eerin\\" << endl;
	sleep(22);
	cout << "\\\\Ebe Endocott\\" << endl;
	sleep(22);
	cout << "\\\\Elan\\" << endl;
	sleep(22);
	cout << "\\\\Emtrey\\" << endl;
	sleep(22);
	cout << "\\\\FX-7\\" << endl;
	sleep(22);
	cout << "\\\\Keyan Farlander\\" << endl;
	sleep(22);
	cout << "\\\\Jagged Fel\\" << endl;
	sleep(22);
	cout << "\\\\Roan Fel\\" << endl;
	sleep(22);
	cout << "\\\\Baron Soontir Fel\\" << endl;
	sleep(22);
	cout << "\\\\Davin Felth\\" << endl;
	sleep(22);
	cout << "\\\\Borsk Fey'lya\\" << endl;
	sleep(22);
	cout << "\\\\Commander Fil\\" << endl;
	sleep(22);
	cout << "\\\\Commander Fox\\" << endl;
	sleep(22);
	cout << "\\\\Ganodi\\" << endl;
	sleep(22);
	cout << "\\\\Yarna D'al Gargan\\" << endl;
	sleep(22);
	cout << "\\\\Saw Gerrera\\" << endl;
	sleep(22);
	cout << "\\\\Steela Gerrera\\" << endl;
	sleep(22);
	cout << "\\\\Mirta Gev\\" << endl;
	sleep(22);
	cout << "\\\\Commander Gree\\" << endl;
	sleep(22);
	cout << "\\\\Janus Greejatus\\" << endl;
	sleep(22);
	cout << "\\\\Captain Gregor\\" << endl;
	sleep(22);
	cout << "\\\\Falon Grey\\" << endl;
	sleep(22);
	cout << "\\\\Gungi\\" << endl;
	sleep(22);
	cout << "\\\\Harrar\\" << endl;
	sleep(22);
	cout << "\\\\Grand Moff Bertroff Hissa\\" << endl;
	sleep(22);
	cout << "\\\\Corran Horn\\" << endl;
	sleep(22);
	cout << "\\\\IG-88\\" << endl;
	sleep(22);
	cout << "\\\\Ikrit\\" << endl;
	sleep(22);
	cout << "\\\\Armand Isard\\" << endl;
	sleep(22);
	cout << "\\\\Ysanne Isard\\" << endl;
	sleep(22);
	cout << "\\\\Irek Ismaren\\" << endl;
	sleep(22);
	cout << "\\\\Prince Isolder\\" << endl;
	sleep(22);
	cout << "\\\\Shimrra Jamaane\\" << endl;
	sleep(22);
	cout << "\\\\Wes Janson\\" << endl;
	sleep(22);
	cout << "\\\\Jarael\\" << endl;
	sleep(22);
	cout << "\\\\Carnor Jax\\" << endl;
	sleep(22);
	cout << "\\\\Jedgar\\" << endl;
	sleep(22);
	cout << "\\\\Jek-14\\" << endl;
	sleep(22);
	cout << "\\\\Commander Jet\\" << endl;
	sleep(22);
	cout << "\\\\Jubnuk\\" << endl;
	sleep(22);
	cout << "\\\\Bardan Jusik\\" << endl;
	sleep(22);
	cout << "\\\\Tenel Ka\\" << endl;
	sleep(22);
	cout << "\\\\Kadann\\" << endl;
	sleep(22);
	cout << "\\\\Kanan Jarus\\" << endl;
	sleep(22);
	cout << "\\\\Kir Kanos\\" << endl;
	sleep(22);
	cout << "\\\\Admiral Saul Karath\\" << endl;
	sleep(22);
	cout << "\\\\Talon Karrde\\" << endl;
	sleep(22);
	cout << "\\\\Jodo Kast\\" << endl;
	sleep(22);
	cout << "\\\\Gavar Khai\\" << endl;
	sleep(22);
	cout << "\\\\Vestara Khai\\" << endl;
	sleep(22);
	cout << "\\\\Klaatu\\" << endl;
	cout << endl;
	sleep(500);
	cout << "[ENTRY POINT FOUND]" << endl << endl;
	sleep(2000);
	cout << "\\\\R2D2\\" << endl;
	sleep(3000);
}

int main(void){

	char jedi[] = {'*','/', 'z', '}'};
	char entry_points[] = {'-', '!' , '/', 'y'};

	Level1 *lvl1 = new Level1();

	char pwlevels[] = {'+', ',', '|', '}'};
	char routers[] = {'!', ',', '*', 'z'};

	Level2 *lvl2 = new Level2();

	char connections[] = {'z', ')', '/', '+'};
	char gauges[] = {'(',',', '}', '+'};

	int step = 1;

	bool running;
	running = true;

	intro();

	char rails[] = {'~', 'y', '.', '~'};
	char ptrs[] = {'/', '*', '+', '.'};

	while(running){

		clear();

		switch(step){
			case 1:
				running = lvl1->update(step);
				break;

			case 2:
				if(!lvl1->done()){
					step--;
				} else {
					running = lvl2->update(step);
				}
				break;

			case 3:
				if(!(lvl1->done() && lvl2->done())){
					step--;
				} else {

					char temp = '\0';

					for(size_t i = 0; i < 4; i++)
					{
						temp = jedi[i] ^ 0x18;
						cout << temp;
					}

					for(size_t i = 0; i < 4; i++)
					{
						temp = entry_points[i] ^ 0x18;
						cout << temp;
					}

					for(size_t i = 0; i < 4; i++)
					{
						temp = pwlevels[i] ^ 0x18;
						cout << temp;
					}

					for(size_t i = 0; i < 4; i++)
					{
						temp = routers[i] ^ 0x18;
						cout << temp;
					}

					for(size_t i = 0; i < 4; i++)
					{
						temp = connections[i] ^ 0x18;
						cout << temp;
					}

					for(size_t i = 0; i < 4; i++)
					{
						temp = gauges[i] ^ 0x18;
						cout << temp;
					}

					for(size_t i = 0; i < 4; i++)
					{
						temp = rails[i] ^ 0x18;
						cout << temp;
					}

					for(size_t i = 0; i < 4; i++)
					{
						temp = ptrs[i] ^ 0x18;
						cout << temp;
					}

					for(size_t i = 0; i < 4; i++)
					{
						temp = lvl1->getFuses()[i] ^ 0x18;
						cout << temp;
					}

					for(size_t i = 0; i < 4; i++)
					{
						temp = lvl2->getDials()[i] ^ 0x18;
						cout << temp;
					}

					cout << "\n\n\n\n\n" << endl;
				}

				break;
		}
	}

	cout << string(50, '\n');

	return 0;
}
