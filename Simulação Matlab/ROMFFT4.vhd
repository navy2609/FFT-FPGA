library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROMFFT4 is
	Port(
		Adress : in STD_LOGIC;
		reset : in STD_LOGIC;
		Data : out STD_LOGIC_VECTOR (20 downto 0)
		);
end ROMFFT4;

architecture Behavioral of ROMFFT4 is

	type ROM is array (863 downto 0) of std_logic_vector(20 downto 0) ;
	-- ROM 5 
	constant ROM_tb : ROM := (
		0 => "011000000110111110101",
		1 => "011000000110111110101",
		2 => "011000000110111110101",
		3 => "011100000100001010011",
		4 => "011100000100001010011",
		5 => "011100000100001010011",
		6 => "011010100100001010010",
		7 => "011010100100001010010",
		8 => "011010100100001010010",
		9 => "001001011100001010101",
		10 => "001001011100001010101",
		11 => "001001011100001010101",
		12 => "001000111100001110011",
		13 => "001000111100001110011",
		14 => "001000111100001110011",
		15 => "011000000101111011000",
		16 => "011000000101111011000",
		17 => "011000000101111011000",
		18 => "011001111100011110010",
		19 => "011001111100011110010",
		20 => "011001111100011110010",
		21 => "001010011100011110010",
		22 => "001010011100011110010",
		23 => "001010011100011110010",
		24 => "011001100100001110000",
		25 => "011001100100001110000",
		26 => "011001100100001110000",
		27 => "001011011100001110010",
		28 => "001011011100001110010",
		29 => "001011011100001110010",
		30 => "011000000101001010010",
		31 => "011000000101001010010",
		32 => "011000000101001010010",
		33 => "011000001101100010011",
		34 => "011000001101100010011",
		35 => "011000001101100010011",
		36 => "011010100100001110010",
		37 => "011010100100001110010",
		38 => "011010100100001110010",
		39 => "011000000101101010011",
		40 => "011000000101101010011",
		41 => "011000000101101010011",
		42 => "011000000101111010100",
		43 => "011000000101111010100",
		44 => "011000000101111010100",
		45 => "011000011110001010110",
		46 => "011000011110001010110",
		47 => "011000011110001010110",
		48 => "001010111100001011011",
		49 => "001010111100001011011",
		50 => "001010111100001011011",
		51 => "011100000100001111001",
		52 => "011100000100001111001",
		53 => "011100000100001111001",
		54 => "001001011100001010101",
		55 => "001001011100001010101",
		56 => "001001011100001010101",
		57 => "011010100100001010010",
		58 => "011010100100001010010",
		59 => "011010100100001010010",
		60 => "001000111100001110011",
		61 => "001000111100001110011",
		62 => "001000111100001110011",
		63 => "001000111100001010011",
		64 => "001000111100001010011",
		65 => "001000111100001010011",
		66 => "011001000100001110011",
		67 => "011001000100001110011",
		68 => "011001000100001110011",
		69 => "011001000100001010100",
		70 => "011001000100001010100",
		71 => "011001000100001010100",
		72 => "001000011100111010000",
		73 => "001000011100111010000",
		74 => "001000011100111010000",
		75 => "001000000100101010110",
		76 => "001000000100101010110",
		77 => "001000000100101010110",
		78 => "011000000101001010010",
		79 => "011000000101001010010",
		80 => "011000000101001010010",
		81 => "011000001101100010011",
		82 => "011000001101100010011",
		83 => "011000001101100010011",
		84 => "011000000101011010010",
		85 => "011000000101011010010",
		86 => "011000000101011010010",
		87 => "001001100101101010000",
		88 => "001001100101101010000",
		89 => "001001100101101010000",
		90 => "011011100100001110100",
		91 => "011011100100001110100",
		92 => "011011100100001110100",
		93 => "011100000101101010000",
		94 => "011100000101101010000",
		95 => "011100000101101010000",
		96 => "011000000110011110100",
		97 => "011000000110011110100",
		98 => "011000000110011110100",
		99 => "011000001110100010101",
		100 => "011000001110100010101",
		101 => "011000001110100010101",
		102 => "011000000100111010110",
		103 => "011000000100111010110",
		104 => "011000000100111010110",
		105 => "001001111100001010110",
		106 => "001001111100001010110",
		107 => "001001111100001010110",
		108 => "011001011100001010011",
		109 => "011001011100001010011",
		110 => "011001011100001010011",
		111 => "011000111100001010011",
		112 => "011000111100001010011",
		113 => "011000111100001010011",
		114 => "011000000101011010011",
		115 => "011000000101011010011",
		116 => "011000000101011010011",
		117 => "011000010100111010110",
		118 => "011000010100111010110",
		119 => "011000010100111010110",
		120 => "001010011100001011001",
		121 => "001010011100001011001",
		122 => "001010011100001011001",
		123 => "011000001110100010101",
		124 => "011000001110100010101",
		125 => "011000001110100010101",
		126 => "011000001101110010011",
		127 => "011000001101110010011",
		128 => "011000001101110010011",
		129 => "011011000100001010011",
		130 => "011011000100001010011",
		131 => "011011000100001010011",
		132 => "011001100100001110010",
		133 => "011001100100001110010",
		134 => "011001100100001110010",
		135 => "011001100100001110001",
		136 => "011001100100001110001",
		137 => "011001100100001110001",
		138 => "011010100100001110011",
		139 => "011010100100001110011",
		140 => "011010100100001110011",
		141 => "011000000101110011001",
		142 => "011000000101110011001",
		143 => "011000000101110011001",
		144 => "011000000110011110100",
		145 => "011000000110011110100",
		146 => "011000000110011110100",
		147 => "011000001110100010101",
		148 => "011000001110100010101",
		149 => "011000001110100010101",
		150 => "011000000100111010110",
		151 => "011000000100111010110",
		152 => "011000000100111010110",
		153 => "001001111100001010110",
		154 => "001001111100001010110",
		155 => "001001111100001010110",
		156 => "011001011100001010011",
		157 => "011001011100001010011",
		158 => "011001011100001010011",
		159 => "011000111100001010011",
		160 => "011000111100001010011",
		161 => "011000111100001010011",
		162 => "011000000101011010011",
		163 => "011000000101011010011",
		164 => "011000000101011010011",
		165 => "011000010100111010110",
		166 => "011000010100111010110",
		167 => "011000010100111010110",
		168 => "001010011100001011001",
		169 => "001010011100001011001",
		170 => "001010011100001011001",
		171 => "011000001110100010101",
		172 => "011000001110100010101",
		173 => "011000001110100010101",
		174 => "011000001101110010011",
		175 => "011000001101110010011",
		176 => "011000001101110010011",
		177 => "011011000100001010011",
		178 => "011011000100001010011",
		179 => "011011000100001010011",
		180 => "011001100100001110010",
		181 => "011001100100001110010",
		182 => "011001100100001110010",
		183 => "011001100100001110001",
		184 => "011001100100001110001",
		185 => "011001100100001110001",
		186 => "011010100100001110011",
		187 => "011010100100001110011",
		188 => "011010100100001110011",
		189 => "011000000101110011001",
		190 => "011000000101110011001",
		191 => "011000000101110011001",
		192 => "011000000101111110011",
		193 => "011000000101111110011",
		194 => "011000000101111110011",
		195 => "011001011101001010000",
		196 => "011001011101001010000",
		197 => "011001011101001010000",
		198 => "011000101100111010001",
		199 => "011000101100111010001",
		200 => "011000101100111010001",
		201 => "011000000101011010101",
		202 => "011000000101011010101",
		203 => "011000000101011010101",
		204 => "001001111100001010111",
		205 => "001001111100001010111",
		206 => "001001111100001010111",
		207 => "011010000100001010010",
		208 => "011010000100001010010",
		209 => "011010000100001010010",
		210 => "001000000100101110110",
		211 => "001000000100101110110",
		212 => "001000000100101110110",
		213 => "011000000101011010101",
		214 => "011000000101011010101",
		215 => "011000000101011010101",
		216 => "011000000101111110011",
		217 => "011000000101111110011",
		218 => "011000000101111110011",
		219 => "011001011101001010000",
		220 => "011001011101001010000",
		221 => "011001011101001010000",
		222 => "011000101100111010001",
		223 => "011000101100111010001",
		224 => "011000101100111010001",
		225 => "011000000101011010101",
		226 => "011000000101011010101",
		227 => "011000000101011010101",
		228 => "001001111100001010111",
		229 => "001001111100001010111",
		230 => "001001111100001010111",
		231 => "011010000100001010010",
		232 => "011010000100001010010",
		233 => "011010000100001010010",
		234 => "001000000100101110110",
		235 => "001000000100101110110",
		236 => "001000000100101110110",
		237 => "011000000101011010101",
		238 => "011000000101011010101",
		239 => "011000000101011010101",
		240 => "011000000101111110011",
		241 => "011000000101111110011",
		242 => "011000000101111110011",
		243 => "011001011101001010000",
		244 => "011001011101001010000",
		245 => "011001011101001010000",
		246 => "011000101100111010001",
		247 => "011000101100111010001",
		248 => "011000101100111010001",
		249 => "011000000101011010101",
		250 => "011000000101011010101",
		251 => "011000000101011010101",
		252 => "001001111100001010111",
		253 => "001001111100001010111",
		254 => "001001111100001010111",
		255 => "011010000100001010010",
		256 => "011010000100001010010",
		257 => "011010000100001010010",
		258 => "001000000100101110110",
		259 => "001000000100101110110",
		260 => "001000000100101110110",
		261 => "011000000101011010101",
		262 => "011000000101011010101",
		263 => "011000000101011010101",
		264 => "011000000101111110011",
		265 => "011000000101111110011",
		266 => "011000000101111110011",
		267 => "011001011101001010000",
		268 => "011001011101001010000",
		269 => "011001011101001010000",
		270 => "011000101100111010001",
		271 => "011000101100111010001",
		272 => "011000101100111010001",
		273 => "011000000101011010101",
		274 => "011000000101011010101",
		275 => "011000000101011010101",
		276 => "001001111100001010111",
		277 => "001001111100001010111",
		278 => "001001111100001010111",
		279 => "011010000100001010010",
		280 => "011010000100001010010",
		281 => "011010000100001010010",
		282 => "001000000100101110110",
		283 => "001000000100101110110",
		284 => "001000000100101110110",
		285 => "011000000101011010101",
		286 => "011000000101011010101",
		287 => "011000000101011010101",
		288 => "011010100100001110100",
		289 => "011010100100001110100",
		290 => "011010100100001110100",
		291 => "111011010100001010011",
		292 => "111011010100001010011",
		293 => "111011010100001010011",
		294 => "011010100100001110100",
		295 => "011010100100001110100",
		296 => "011010100100001110100",
		297 => "011000001101100010011",
		298 => "011000001101100010011",
		299 => "011000001101100010011",
		300 => "011010100100001110100",
		301 => "011010100100001110100",
		302 => "011010100100001110100",
		303 => "111011010100001010011",
		304 => "111011010100001010011",
		305 => "111011010100001010011",
		306 => "011010100100001110100",
		307 => "011010100100001110100",
		308 => "011010100100001110100",
		309 => "011000001101100010011",
		310 => "011000001101100010011",
		311 => "011000001101100010011",
		312 => "011010100100001110100",
		313 => "011010100100001110100",
		314 => "011010100100001110100",
		315 => "111011010100001010011",
		316 => "111011010100001010011",
		317 => "111011010100001010011",
		318 => "011010100100001110100",
		319 => "011010100100001110100",
		320 => "011010100100001110100",
		321 => "011000001101100010011",
		322 => "011000001101100010011",
		323 => "011000001101100010011",
		324 => "011010100100001110100",
		325 => "011010100100001110100",
		326 => "011010100100001110100",
		327 => "111011010100001010011",
		328 => "111011010100001010011",
		329 => "111011010100001010011",
		330 => "011010100100001110100",
		331 => "011010100100001110100",
		332 => "011010100100001110100",
		333 => "011000001101100010011",
		334 => "011000001101100010011",
		335 => "011000001101100010011",
		336 => "011010100100001110100",
		337 => "011010100100001110100",
		338 => "011010100100001110100",
		339 => "111011010100001010011",
		340 => "111011010100001010011",
		341 => "111011010100001010011",
		342 => "011010100100001110100",
		343 => "011010100100001110100",
		344 => "011010100100001110100",
		345 => "011000001101100010011",
		346 => "011000001101100010011",
		347 => "011000001101100010011",
		348 => "011010100100001110100",
		349 => "011010100100001110100",
		350 => "011010100100001110100",
		351 => "111011010100001010011",
		352 => "111011010100001010011",
		353 => "111011010100001010011",
		354 => "011010100100001110100",
		355 => "011010100100001110100",
		356 => "011010100100001110100",
		357 => "011000001101100010011",
		358 => "011000001101100010011",
		359 => "011000001101100010011",
		360 => "011010100100001110100",
		361 => "011010100100001110100",
		362 => "011010100100001110100",
		363 => "111011010100001010011",
		364 => "111011010100001010011",
		365 => "111011010100001010011",
		366 => "011010100100001110100",
		367 => "011010100100001110100",
		368 => "011010100100001110100",
		369 => "011000001101100010011",
		370 => "011000001101100010011",
		371 => "011000001101100010011",
		372 => "011010100100001110100",
		373 => "011010100100001110100",
		374 => "011010100100001110100",
		375 => "111011010100001010011",
		376 => "111011010100001010011",
		377 => "111011010100001010011",
		378 => "011010100100001110100",
		379 => "011010100100001110100",
		380 => "011010100100001110100",
		381 => "011000001101100010011",
		382 => "011000001101100010011",
		383 => "011000001101100010011",
		384 => "011001111100001010110",
		385 => "011001111100001010110",
		386 => "011001111100001010110",
		387 => "011011000100001110011",
		388 => "011011000100001110011",
		389 => "011011000100001110011",
		390 => "011001111100001010110",
		391 => "011001111100001010110",
		392 => "011001111100001010110",
		393 => "011011000100001110011",
		394 => "011011000100001110011",
		395 => "011011000100001110011",
		396 => "011001111100001010110",
		397 => "011001111100001010110",
		398 => "011001111100001010110",
		399 => "011011000100001110011",
		400 => "011011000100001110011",
		401 => "011011000100001110011",
		402 => "011001111100001010110",
		403 => "011001111100001010110",
		404 => "011001111100001010110",
		405 => "011011000100001110011",
		406 => "011011000100001110011",
		407 => "011011000100001110011",
		408 => "011001111100001010110",
		409 => "011001111100001010110",
		410 => "011001111100001010110",
		411 => "011011000100001110011",
		412 => "011011000100001110011",
		413 => "011011000100001110011",
		414 => "011001111100001010110",
		415 => "011001111100001010110",
		416 => "011001111100001010110",
		417 => "011011000100001110011",
		418 => "011011000100001110011",
		419 => "011011000100001110011",
		420 => "011001111100001010110",
		421 => "011001111100001010110",
		422 => "011001111100001010110",
		423 => "011011000100001110011",
		424 => "011011000100001110011",
		425 => "011011000100001110011",
		426 => "011001111100001010110",
		427 => "011001111100001010110",
		428 => "011001111100001010110",
		429 => "011011000100001110011",
		430 => "011011000100001110011",
		431 => "011011000100001110011",
		432 => "011001111100001010110",
		433 => "011001111100001010110",
		434 => "011001111100001010110",
		435 => "011011000100001110011",
		436 => "011011000100001110011",
		437 => "011011000100001110011",
		438 => "011001111100001010110",
		439 => "011001111100001010110",
		440 => "011001111100001010110",
		441 => "011011000100001110011",
		442 => "011011000100001110011",
		443 => "011011000100001110011",
		444 => "011001111100001010110",
		445 => "011001111100001010110",
		446 => "011001111100001010110",
		447 => "011011000100001110011",
		448 => "011011000100001110011",
		449 => "011011000100001110011",
		450 => "011001111100001010110",
		451 => "011001111100001010110",
		452 => "011001111100001010110",
		453 => "011011000100001110011",
		454 => "011011000100001110011",
		455 => "011011000100001110011",
		456 => "011001111100001010110",
		457 => "011001111100001010110",
		458 => "011001111100001010110",
		459 => "011011000100001110011",
		460 => "011011000100001110011",
		461 => "011011000100001110011",
		462 => "011001111100001010110",
		463 => "011001111100001010110",
		464 => "011001111100001010110",
		465 => "011011000100001110011",
		466 => "011011000100001110011",
		467 => "011011000100001110011",
		468 => "011001111100001010110",
		469 => "011001111100001010110",
		470 => "011001111100001010110",
		471 => "011011000100001110011",
		472 => "011011000100001110011",
		473 => "011011000100001110011",
		474 => "011001111100001010110",
		475 => "011001111100001010110",
		476 => "011001111100001010110",
		477 => "011011000100001110011",
		478 => "011011000100001110011",
		479 => "011011000100001110011",
		480 => "011000101100100010101",
		481 => "011000101100100010101",
		482 => "011000101100100010101",
		483 => "011000101100100010101",
		484 => "011000101100100010101",
		485 => "011000101100100010101",
		486 => "011000101100100010101",
		487 => "011000101100100010101",
		488 => "011000101100100010101",
		489 => "011000101100100010101",
		490 => "011000101100100010101",
		491 => "011000101100100010101",
		492 => "011000101100100010101",
		493 => "011000101100100010101",
		494 => "011000101100100010101",
		495 => "011000101100100010101",
		496 => "011000101100100010101",
		497 => "011000101100100010101",
		498 => "011000101100100010101",
		499 => "011000101100100010101",
		500 => "011000101100100010101",
		501 => "011000101100100010101",
		502 => "011000101100100010101",
		503 => "011000101100100010101",
		504 => "011000101100100010101",
		505 => "011000101100100010101",
		506 => "011000101100100010101",
		507 => "011000101100100010101",
		508 => "011000101100100010101",
		509 => "011000101100100010101",
		510 => "011000101100100010101",
		511 => "011000101100100010101",
		512 => "011000101100100010101",
		513 => "011000101100100010101",
		514 => "011000101100100010101",
		515 => "011000101100100010101",
		516 => "011000101100100010101",
		517 => "011000101100100010101",
		518 => "011000101100100010101",
		519 => "011000101100100010101",
		520 => "011000101100100010101",
		521 => "011000101100100010101",
		522 => "011000101100100010101",
		523 => "011000101100100010101",
		524 => "011000101100100010101",
		525 => "011000101100100010101",
		526 => "011000101100100010101",
		527 => "011000101100100010101",
		528 => "011000101100100010101",
		529 => "011000101100100010101",
		530 => "011000101100100010101",
		531 => "011000101100100010101",
		532 => "011000101100100010101",
		533 => "011000101100100010101",
		534 => "011000101100100010101",
		535 => "011000101100100010101",
		536 => "011000101100100010101",
		537 => "011000101100100010101",
		538 => "011000101100100010101",
		539 => "011000101100100010101",
		540 => "011000101100100010101",
		541 => "011000101100100010101",
		542 => "011000101100100010101",
		543 => "011000101100100010101",
		544 => "011000101100100010101",
		545 => "011000101100100010101",
		546 => "011000101100100010101",
		547 => "011000101100100010101",
		548 => "011000101100100010101",
		549 => "011000101100100010101",
		550 => "011000101100100010101",
		551 => "011000101100100010101",
		552 => "011000101100100010101",
		553 => "011000101100100010101",
		554 => "011000101100100010101",
		555 => "011000101100100010101",
		556 => "011000101100100010101",
		557 => "011000101100100010101",
		558 => "011000101100100010101",
		559 => "011000101100100010101",
		560 => "011000101100100010101",
		561 => "011000101100100010101",
		562 => "011000101100100010101",
		563 => "011000101100100010101",
		564 => "011000101100100010101",
		565 => "011000101100100010101",
		566 => "011000101100100010101",
		567 => "011000101100100010101",
		568 => "011000101100100010101",
		569 => "011000101100100010101",
		570 => "011000101100100010101",
		571 => "011000101100100010101",
		572 => "011000101100100010101",
		573 => "011000101100100010101",
		574 => "011000101100100010101",
		575 => "011000101100100010101",
		576 => "011000101100100110010",
		577 => "011000101100100110010",
		578 => "011000101100100110010",
		579 => "011000101100100110010",
		580 => "011000101100100110010",
		581 => "011000101100100110010",
		582 => "011000101100100110010",
		583 => "011000101100100110010",
		584 => "011000101100100110010",
		585 => "011000101100100110010",
		586 => "011000101100100110010",
		587 => "011000101100100110010",
		588 => "011000101100100110010",
		589 => "011000101100100110010",
		590 => "011000101100100110010",
		591 => "011000101100100110010",
		592 => "011000101100100110010",
		593 => "011000101100100110010",
		594 => "011000101100100110010",
		595 => "011000101100100110010",
		596 => "011000101100100110010",
		597 => "011000101100100110010",
		598 => "011000101100100110010",
		599 => "011000101100100110010",
		600 => "011000101100100110010",
		601 => "011000101100100110010",
		602 => "011000101100100110010",
		603 => "011000101100100110010",
		604 => "011000101100100110010",
		605 => "011000101100100110010",
		606 => "011000101100100110010",
		607 => "011000101100100110010",
		608 => "011000101100100110010",
		609 => "011000101100100110010",
		610 => "011000101100100110010",
		611 => "011000101100100110010",
		612 => "011000101100100110010",
		613 => "011000101100100110010",
		614 => "011000101100100110010",
		615 => "011000101100100110010",
		616 => "011000101100100110010",
		617 => "011000101100100110010",
		618 => "011000101100100110010",
		619 => "011000101100100110010",
		620 => "011000101100100110010",
		621 => "011000101100100110010",
		622 => "011000101100100110010",
		623 => "011000101100100110010",
		624 => "011000101100100110010",
		625 => "011000101100100110010",
		626 => "011000101100100110010",
		627 => "011000101100100110010",
		628 => "011000101100100110010",
		629 => "011000101100100110010",
		630 => "011000101100100110010",
		631 => "011000101100100110010",
		632 => "011000101100100110010",
		633 => "011000101100100110010",
		634 => "011000101100100110010",
		635 => "011000101100100110010",
		636 => "011000101100100110010",
		637 => "011000101100100110010",
		638 => "011000101100100110010",
		639 => "011000101100100110010",
		640 => "011000101100100110010",
		641 => "011000101100100110010",
		642 => "011000101100100110010",
		643 => "011000101100100110010",
		644 => "011000101100100110010",
		645 => "011000101100100110010",
		646 => "011000101100100110010",
		647 => "011000101100100110010",
		648 => "011000101100100110010",
		649 => "011000101100100110010",
		650 => "011000101100100110010",
		651 => "011000101100100110010",
		652 => "011000101100100110010",
		653 => "011000101100100110010",
		654 => "011000101100100110010",
		655 => "011000101100100110010",
		656 => "011000101100100110010",
		657 => "011000101100100110010",
		658 => "011000101100100110010",
		659 => "011000101100100110010",
		660 => "011000101100100110010",
		661 => "011000101100100110010",
		662 => "011000101100100110010",
		663 => "011000101100100110010",
		664 => "011000101100100110010",
		665 => "011000101100100110010",
		666 => "011000101100100110010",
		667 => "011000101100100110010",
		668 => "011000101100100110010",
		669 => "011000101100100110010",
		670 => "011000101100100110010",
		671 => "011000101100100110010",
		672 => "111000010100001010000",
		673 => "111000010100001010000",
		674 => "111000010100001010000",
		675 => "111000010100001010000",
		676 => "111000010100001010000",
		677 => "111000010100001010000",
		678 => "111000010100001010000",
		679 => "111000010100001010000",
		680 => "111000010100001010000",
		681 => "111000010100001010000",
		682 => "111000010100001010000",
		683 => "111000010100001010000",
		684 => "111000010100001010000",
		685 => "111000010100001010000",
		686 => "111000010100001010000",
		687 => "111000010100001010000",
		688 => "111000010100001010000",
		689 => "111000010100001010000",
		690 => "111000010100001010000",
		691 => "111000010100001010000",
		692 => "111000010100001010000",
		693 => "111000010100001010000",
		694 => "111000010100001010000",
		695 => "111000010100001010000",
		696 => "111000010100001010000",
		697 => "111000010100001010000",
		698 => "111000010100001010000",
		699 => "111000010100001010000",
		700 => "111000010100001010000",
		701 => "111000010100001010000",
		702 => "111000010100001010000",
		703 => "111000010100001010000",
		704 => "111000010100001010000",
		705 => "111000010100001010000",
		706 => "111000010100001010000",
		707 => "111000010100001010000",
		708 => "111000010100001010000",
		709 => "111000010100001010000",
		710 => "111000010100001010000",
		711 => "111000010100001010000",
		712 => "111000010100001010000",
		713 => "111000010100001010000",
		714 => "111000010100001010000",
		715 => "111000010100001010000",
		716 => "111000010100001010000",
		717 => "111000010100001010000",
		718 => "111000010100001010000",
		719 => "111000010100001010000",
		720 => "111000010100001010000",
		721 => "111000010100001010000",
		722 => "111000010100001010000",
		723 => "111000010100001010000",
		724 => "111000010100001010000",
		725 => "111000010100001010000",
		726 => "111000010100001010000",
		727 => "111000010100001010000",
		728 => "111000010100001010000",
		729 => "111000010100001010000",
		730 => "111000010100001010000",
		731 => "111000010100001010000",
		732 => "111000010100001010000",
		733 => "111000010100001010000",
		734 => "111000010100001010000",
		735 => "111000010100001010000",
		736 => "111000010100001010000",
		737 => "111000010100001010000",
		738 => "111000010100001010000",
		739 => "111000010100001010000",
		740 => "111000010100001010000",
		741 => "111000010100001010000",
		742 => "111000010100001010000",
		743 => "111000010100001010000",
		744 => "111000010100001010000",
		745 => "111000010100001010000",
		746 => "111000010100001010000",
		747 => "111000010100001010000",
		748 => "111000010100001010000",
		749 => "111000010100001010000",
		750 => "111000010100001010000",
		751 => "111000010100001010000",
		752 => "111000010100001010000",
		753 => "111000010100001010000",
		754 => "111000010100001010000",
		755 => "111000010100001010000",
		756 => "111000010100001010000",
		757 => "111000010100001010000",
		758 => "111000010100001010000",
		759 => "111000010100001010000",
		760 => "111000010100001010000",
		761 => "111000010100001010000",
		762 => "111000010100001010000",
		763 => "111000010100001010000",
		764 => "111000010100001010000",
		765 => "111000010100001010000",
		766 => "111000010100001010000",
		767 => "111000010100001010000",
		768 => "111000010100001010000",
		769 => "111000010100001010000",
		770 => "111000010100001010000",
		771 => "111000010100001010000",
		772 => "111000010100001010000",
		773 => "111000010100001010000",
		774 => "111000010100001010000",
		775 => "111000010100001010000",
		776 => "111000010100001010000",
		777 => "111000010100001010000",
		778 => "111000010100001010000",
		779 => "111000010100001010000",
		780 => "111000010100001010000",
		781 => "111000010100001010000",
		782 => "111000010100001010000",
		783 => "111000010100001010000",
		784 => "111000010100001010000",
		785 => "111000010100001010000",
		786 => "111000010100001010000",
		787 => "111000010100001010000",
		788 => "111000010100001010000",
		789 => "111000010100001010000",
		790 => "111000010100001010000",
		791 => "111000010100001010000",
		792 => "111000010100001010000",
		793 => "111000010100001010000",
		794 => "111000010100001010000",
		795 => "111000010100001010000",
		796 => "111000010100001010000",
		797 => "111000010100001010000",
		798 => "111000010100001010000",
		799 => "111000010100001010000",
		800 => "111000010100001010000",
		801 => "111000010100001010000",
		802 => "111000010100001010000",
		803 => "111000010100001010000",
		804 => "111000010100001010000",
		805 => "111000010100001010000",
		806 => "111000010100001010000",
		807 => "111000010100001010000",
		808 => "111000010100001010000",
		809 => "111000010100001010000",
		810 => "111000010100001010000",
		811 => "111000010100001010000",
		812 => "111000010100001010000",
		813 => "111000010100001010000",
		814 => "111000010100001010000",
		815 => "111000010100001010000",
		816 => "111000010100001010000",
		817 => "111000010100001010000",
		818 => "111000010100001010000",
		819 => "111000010100001010000",
		820 => "111000010100001010000",
		821 => "111000010100001010000",
		822 => "111000010100001010000",
		823 => "111000010100001010000",
		824 => "111000010100001010000",
		825 => "111000010100001010000",
		826 => "111000010100001010000",
		827 => "111000010100001010000",
		828 => "111000010100001010000",
		829 => "111000010100001010000",
		830 => "111000010100001010000",
		831 => "111000010100001010000",
		832 => "111000010100001010000",
		833 => "111000010100001010000",
		834 => "111000010100001010000",
		835 => "111000010100001010000",
		836 => "111000010100001010000",
		837 => "111000010100001010000",
		838 => "111000010100001010000",
		839 => "111000010100001010000",
		840 => "111000010100001010000",
		841 => "111000010100001010000",
		842 => "111000010100001010000",
		843 => "111000010100001010000",
		844 => "111000010100001010000",
		845 => "111000010100001010000",
		846 => "111000010100001010000",
		847 => "111000010100001010000",
		848 => "111000010100001010000",
		849 => "111000010100001010000",
		850 => "111000010100001010000",
		851 => "111000010100001010000",
		852 => "111000010100001010000",
		853 => "111000010100001010000",
		854 => "111000010100001010000",
		855 => "111000010100001010000",
		856 => "111000010100001010000",
		857 => "111000010100001010000",
		858 => "111000010100001010000",
		859 => "111000010100001010000",
		860 => "111000010100001010000",
		861 => "111000010100001010000",
		862 => "111000010100001010000",
		863 => "111000010100001010000");

	begin
		--Process to acess Data
		process(Adress, reset)

			variable Counter : integer range 510 downto 0 := 0;

		begin

		Data <= Rom_tb(Counter);
		if(reset = '1')then
			Counter := 0;

		elsif(Adress'event and Adress = '1') then
			Counter := Counter + 1;

		end if;

	end process;

end Behavioral;