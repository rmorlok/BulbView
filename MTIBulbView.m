//
//  MTIBulbView.m
//  Copyright 2009 Ryan Morlok
//  http://softwareblog.morlok.net/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "MTIBulbView.h"

#define NUM_BULBS_VERTICAL					7

#define BULB_UNSCALED_DIAMETER				9.0
#define BULB_UNSCALED_SPACE					1.0

#define MAKEBYTE(b0, b1, b2, b3, b4, b5, b6) (b0 << 0 | b1 << 1 | b2 << 2 | b3 << 3 | b4 << 4 | b5 << 5 | b6 << 6)

void setBulbsForCol(char* bulbArray, NSUInteger curCol, NSUInteger numCols, char byte)
{
	if( curCol >= numCols )
		return;
	bulbArray[curCol] = byte;
}

void setBulbsForChar(char* bulbArray, char c, NSUInteger *curCol, NSUInteger numCols)
{
	if( c >= 'a' && c <= 'z' )
		c = 'A' + (c - 'a');
	
	switch (c) {
		case '0' :
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case '1' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 0) );
			break;
		}
		case '2' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 1, 1, 1) );
			break;
		}
		case '3' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case '4' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case '5' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 0, 0, 1) );
			break;
		}
		case '6' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 0, 0, 1) );
			break;
		}
		case '7' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case '8' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case '9' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case 'A' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 0) );
			break;
		}
		case 'B' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 1, 1, 0) );
			break;
		}
		case 'C' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case 'D' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 0) );
			break;
		}
		case 'E' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case 'F' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case 'G' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 0, 1, 0) );
			break;
		}
		case 'H' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case 'I' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case 'J' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case 'K' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case 'L' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			break;
		}
		case 'M' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case 'N' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case 'O' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 0) );
			break;
		}
		case 'P' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 1, 0) );
			break;
		}
		case 'Q' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 1, 1, 1, 1, 0) );
			break;
		}
		case 'R' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 1, 1, 0) );
			break;
		}
		case 'S' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 0, 1, 0) );
			break;
		}
		case 'T' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case 'U' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case 'V' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 1, 1) );
			break;
		}
		case 'W' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case 'X' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case 'Y' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case 'Z' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 1, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 1, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 1, 1) );
			break;
		}
		case '!' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 1, 1, 1, 1, 1) );
			break;
		}
		case '@' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 1, 0, 1, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 1, 1, 0) );
			break;
		}
		case '#' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 0) );
			break;
		}
		case '$' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 1, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 1, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 0, 0, 0) );
			break;
		}
		case '%' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 0, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 0, 0, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 0, 0, 0, 0, 1) );
			break;
		}
		case '^' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 0) );
			break;
		}
		case '&' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 1, 1, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 1, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 1, 0, 0, 0, 0) );
			break;
		}
		case '*' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 1) );
			break;
		}
		case ')' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 0) );
			break;
		}
		case '(' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 1, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case '"' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 1) );
			break;
		}
		case '\'' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 1) );
			break;
		}
		case ':' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 0, 1, 0) );
			break;
		}
		case ';' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 0, 1, 0) );
			break;
		}
		case '_' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			break;
		}
		case '-' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			break;
		}
		case '+' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 1, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			break;
		}
		case '=' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 0) );
			break;
		}
		case '|' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case '\\' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 1, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 0, 0, 0, 0, 0) );
			break;
		}
		case '}' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			break;
		}
		case '{' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 1, 0, 1, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case ']' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			break;
		}
		case '[' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 1, 1, 1, 1, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case '>' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			break;
		}
		case '<' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 0, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 1) );
			break;
		}
		case '.' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			break;
		}
		case ',' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 1, 0, 0, 0, 0, 0) );
			break;
		}
		case '/' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 1, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 1, 1, 1, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 1) );
			break;
		}
		case ' ' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 0, 0) );
			break;
		}
		case '?' : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 1, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 1, 0) );
			break;
		}
		default : 
		{
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 0, 1, 0) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(1, 0, 1, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 1, 0, 0, 1) );
			setBulbsForCol(bulbArray, (*curCol)++, numCols, MAKEBYTE(0, 0, 0, 0, 1, 1, 0) );
			break;
		}
	}
}

void DrawCol(CGContextRef context, CGColorRef litColor, CGColorRef dimColor, char bulb) 
{
	CGContextSaveGState(context);
	
	CGContextSetFillColorWithColor(context, (bulb & (0x1 << 0) ? litColor : dimColor));
	CGContextFillEllipseInRect(context, CGRectMake(0, 0.0*(BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE), BULB_UNSCALED_DIAMETER, BULB_UNSCALED_DIAMETER));
	CGContextSetFillColorWithColor(context, (bulb & (0x1 << 1) ? litColor : dimColor));
	CGContextFillEllipseInRect(context, CGRectMake(0, 1.0*(BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE), BULB_UNSCALED_DIAMETER, BULB_UNSCALED_DIAMETER));
	CGContextSetFillColorWithColor(context, (bulb & (0x1 << 2) ? litColor : dimColor));
	CGContextFillEllipseInRect(context, CGRectMake(0, 2.0*(BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE), BULB_UNSCALED_DIAMETER, BULB_UNSCALED_DIAMETER));
	CGContextSetFillColorWithColor(context, (bulb & (0x1 << 3) ? litColor : dimColor));
	CGContextFillEllipseInRect(context, CGRectMake(0, 3.0*(BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE), BULB_UNSCALED_DIAMETER, BULB_UNSCALED_DIAMETER));
	CGContextSetFillColorWithColor(context, (bulb & (0x1 << 4) ? litColor : dimColor));
	CGContextFillEllipseInRect(context, CGRectMake(0, 4.0*(BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE), BULB_UNSCALED_DIAMETER, BULB_UNSCALED_DIAMETER));
	CGContextSetFillColorWithColor(context, (bulb & (0x1 << 5) ? litColor : dimColor));
	CGContextFillEllipseInRect(context, CGRectMake(0, 5.0*(BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE), BULB_UNSCALED_DIAMETER, BULB_UNSCALED_DIAMETER));
	CGContextSetFillColorWithColor(context, (bulb & (0x1 << 6) ? litColor : dimColor));
	CGContextFillEllipseInRect(context, CGRectMake(0, 6.0*(BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE), BULB_UNSCALED_DIAMETER, BULB_UNSCALED_DIAMETER));
	
	CGContextRestoreGState(context);
}

@implementation MTIBulbView

#pragma mark Private Methods

- (CGFloat) getScaleFactor
{
	return [self bounds].size.height  / ( ((CGFloat)(NUM_BULBS_VERTICAL-1) * BULB_UNSCALED_SPACE) + ((CGFloat)(NUM_BULBS_VERTICAL * BULB_UNSCALED_DIAMETER)) );
}

- (CGAffineTransform) scaleTranformForFrame
{
	// Compute how much we should scale our drawing based on the 
	// needed height versus the height that is available.
	CGFloat scale = [self getScaleFactor];
	return CGAffineTransformMakeScale(scale, scale);
}

- (NSInteger) getVisibleCols
{
	// Compute number of possible columns based on the diameter
	// of each bulb and the space bewteen them.
	CGFloat scale = [self getScaleFactor];
	return (NSInteger)((([self bounds].size.width/scale) + BULB_UNSCALED_SPACE) / (BULB_UNSCALED_SPACE + BULB_UNSCALED_DIAMETER));
}

#pragma mark Public Methods

@synthesize litColor;
@synthesize dimColor;
@synthesize text;
@synthesize alignment;

- (void) setLitColor:(CGColorRef)color
{
	if( color == litColor )
		return;
	
	[self willChangeValueForKey:@"litColor"];
	CGColorRelease(litColor);
	
	litColor = CGColorRetain(color);
	[self didChangeValueForKey:@"litColor"];

#if TARGET_OS_IPHONE
	[self setNeedsDisplay];
#else
	[self setNeedsDisplay:YES];
#endif
}

- (void) setDimColor:(CGColorRef)color
{
	if( color == dimColor )
		return;

	[self willChangeValueForKey:@"dimColor"];
	CGColorRelease(dimColor);
	
	dimColor = CGColorRetain(color);
	[self didChangeValueForKey:@"dimColor"];
	
#if TARGET_OS_IPHONE
	[self setNeedsDisplay];
#else
	[self setNeedsDisplay:YES];
#endif
}

- (void) setText:(NSString*)t
{
	if( text == t )
		return;
	
	[self willChangeValueForKey:@"text"];
	[text release];
	text = [t retain];
	[self didChangeValueForKey:@"text"];
	
#if TARGET_OS_IPHONE
	[self setNeedsDisplay];
#else
	[self setNeedsDisplay:YES];
#endif
}

- (void) setAlignment:(MTIBulbViewAlignment)align
{
	[self willChangeValueForKey:@"alignment"];
	alignment = align;
	[self didChangeValueForKey:@"alignment"];
	
#if TARGET_OS_IPHONE
	[self setNeedsDisplay];
#else
	[self setNeedsDisplay:YES];
#endif
}

#if TARGET_OS_IPHONE
- (id)initWithFrame:(CGRect)frame {
#else
- (id)initWithFrame:(NSRect)frame {
#endif
    self = [super initWithFrame:frame];
    if (self) {
        // Nothing to see here...
    }
    return self;
}

- (void)drawBulbs:(char*)bulbArray length:(NSUInteger)length context:(CGContextRef)context
{
	// Draw the digits
	for(NSUInteger i = 0; i < length; i++) {
		if( i > 0 ) 
			CGContextTranslateCTM(context, BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE, 0);
				
		DrawCol(context, litColor, dimColor, bulbArray[i]);
	}
}

#if TARGET_OS_IPHONE
- (void)drawRect:(CGRect)rect {
	CGContextRef myContext = UIGraphicsGetCurrentContext();
	
	// Transform coordinate system to account for different origin points
	CGContextTranslateCTM(myContext, 0.0, rect.size.height);
	CGContextScaleCTM(myContext, 1.0, -1.0);
#else
- (void)drawRect:(NSRect)rect {
	CGContextRef myContext = [[NSGraphicsContext currentContext] graphicsPort];
#endif
	
	// Get the number of bulb columns that are visible
	NSUInteger totalCols = [self getVisibleCols];
	
	if( totalCols <= 0 )
		return;
	
	// Allocate an array to hold the lit state of the bulbs
	// Each column of bulbs is stored as a byte bitmask
	char *bulbArray = malloc(totalCols * sizeof(char));
	memset(bulbArray, 0, totalCols * sizeof(char));
	
	// Fill the array with bulb states
	NSUInteger curCol  = 0;
	NSUInteger curChar = 0;
	while( curCol < totalCols
		  && curChar < text.length ) {
		
		// Set the char in the bit array (updates curCol as cols added)
		setBulbsForChar(bulbArray, [text characterAtIndex:curChar++], &curCol, totalCols);
		
		// Add spacing col if we have more characters
		if( curChar < text.length )
			curCol++;
	}
	
	// Scale the drawing for the current size of the view
	CGContextConcatCTM(myContext, [self scaleTranformForFrame]);
	
	NSUInteger colsBefore = 0;
	NSUInteger middleCols = (curCol < totalCols ? curCol : totalCols);
	NSUInteger colsAfter  = 0;
	switch (alignment) {
		case MTIBulbViewAlignLeft:
			colsBefore = 0;
			colsAfter  = totalCols - middleCols;
			break;
		case MTIBulbViewAlignCenter:
			colsBefore = (totalCols - middleCols) / 2;
			colsAfter  = totalCols - (colsBefore + middleCols);
			break;
		case MTIBulbViewAlignRight:
			colsBefore = totalCols - middleCols;
			colsAfter  = 0;
			break;
	}
	
	for(int i = 0; i < colsBefore; i++) {
		if( i > 0 ) 
			CGContextTranslateCTM(myContext, BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE, 0);
		
		DrawCol(myContext, litColor, dimColor, (char)0);
	}
	
	if( colsBefore > 0 
	   && totalCols > colsBefore ) 
		CGContextTranslateCTM(myContext, BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE, 0);
	
	// Draw the bulbs
	[self drawBulbs:bulbArray length:middleCols context:myContext];
	
	if( colsAfter > 0 
	   && totalCols > (colsBefore + middleCols) ) 
		CGContextTranslateCTM(myContext, BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE, 0);
	
	for(int i = 0; i < colsAfter; i++) {
		if( i > 0 ) 
			CGContextTranslateCTM(myContext, BULB_UNSCALED_DIAMETER + BULB_UNSCALED_SPACE, 0);
	
		DrawCol(myContext, litColor, dimColor, (char)0);
	}
	
	free(bulbArray);
}

- (void)dealloc
{
	[text release];
	CGColorRelease(litColor);
	CGColorRelease(dimColor);

	text = nil;
	litColor = NULL;
	dimColor = NULL;
	
	[super dealloc];
}
@end
