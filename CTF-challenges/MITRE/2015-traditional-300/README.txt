Implementation:

This is implemented via a very simple, self-contained single webpage created using HTML/HTML5. Run webpage.html to test.

Solution:

Click the play button under the image of a radio. A series of beeps will sound. Many people will recognize that this is morse code.

Translate this to text. It translates to ZOORA GJAKH ITTEV, which seems like gibberish. You should consider that it is probably still encrypted.

There is also a deck of cards shown on the page. The user can flip through the entire deck by clicking on the topmost card. Googling "deck of cards cipher" will bring up links to the solitaire cipher. Both the wikipedia page and Bruce Schneier's page

The user can then find and follow the process for decrypting a message using the solitaire cipher, using the sequence of the deck of cards on the webpage as a start state of the deck. They can do this using a physical deck, but writing a program to decrypt the message would probably be much faster.

There is a small ambiguity in this cipher in that there are two Jokers involved, of which one will be 'Joker A' and one will be 'Joker B'. Assignment of the Jokers to A and B is somewhat arbitrary. I have picked the Joker with Black lettering as Joker B in this case and the other as Joker A. If you pick the wrong Joker as A initially, you will have to attempt to decrypt the message a second time with the identities of the A and B Joker reversed from your original selection.

When correctly decrypted, you will arrive at the final solution "MCAEECADFCB". The '-' is not included, as the solitaire cipher cannot handle non-alphabetic characters.

Flag:
MCA-EECADFCB