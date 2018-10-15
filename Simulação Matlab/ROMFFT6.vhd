library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROMFFT6 is
	Port(
		Adress : in STD_LOGIC;
		reset : in STD_LOGIC;
		Data : out STD_LOGIC_VECTOR (20 downto 0)
		);
end ROMFFT6;

architecture Behavioral of ROMFFT6 is

	type ROM is array (863 downto 0) of std_logic_vector(20 downto 0) ;
	-- ROM 7 
	constant ROM_tb : ROM := (
		0 => "011100001110011010000",
		1 => "011100001110011010000",
		2 => "011100001110011010000",
		3 => "001001111100001010111",
		4 => "001001111100001010111",
		5 => "001001111100001010111",
		6 => "001001011100001010110",
		7 => "001001011100001010110",
		8 => "001001011100001010110",
		9 => "011000111100111010000",
		10 => "011000111100111010000",
		11 => "011000111100111010000",
		12 => "001000011100111010001",
		13 => "001000011100111010001",
		14 => "001000011100111010001",
		15 => "011000111100111010000",
		16 => "011000111100111010000",
		17 => "011000111100111010000",
		18 => "011000000100111010000",
		19 => "011000000100111010000",
		20 => "011000000100111010000",
		21 => "011001100100001110000",
		22 => "011001100100001110000",
		23 => "011001100100001110000",
		24 => "011000000100111010010",
		25 => "011000000100111010010",
		26 => "011000000100111010010",
		27 => "011000000101101010011",
		28 => "011000000101101010011",
		29 => "011000000101101010011",
		30 => "011000000101001010001",
		31 => "011000000101001010001",
		32 => "011000000101001010001",
		33 => "111000011101011010011",
		34 => "111000011101011010011",
		35 => "111000011101011010011",
		36 => "001000011100101110011",
		37 => "001000011100101110011",
		38 => "001000011100101110011",
		39 => "011000000101011010111",
		40 => "011000000101011010111",
		41 => "011000000101011010111",
		42 => "011000000101111010011",
		43 => "011000000101111010011",
		44 => "011000000101111010011",
		45 => "011000001100110110110",
		46 => "011000001100110110110",
		47 => "011000001100110110110",
		48 => "001000011110011010111",
		49 => "001000011110011010111",
		50 => "001000011110011010111",
		51 => "011011100100001010011",
		52 => "011011100100001010011",
		53 => "011011100100001010011",
		54 => "011011000100001010010",
		55 => "011011000100001010010",
		56 => "011011000100001010010",
		57 => "011000111100111010000",
		58 => "011000111100111010000",
		59 => "011000111100111010000",
		60 => "011010000100001010100",
		61 => "011010000100001010100",
		62 => "011010000100001010100",
		63 => "011000111100111010000",
		64 => "011000111100111010000",
		65 => "011000111100111010000",
		66 => "011001100100001110000",
		67 => "011001100100001110000",
		68 => "011001100100001110000",
		69 => "001000011100111010000",
		70 => "001000011100111010000",
		71 => "001000011100111010000",
		72 => "011000000101101010001",
		73 => "011000000101101010001",
		74 => "011000000101101010001",
		75 => "011000000101101010011",
		76 => "011000000101101010011",
		77 => "011000000101101010011",
		78 => "011000000101001010001",
		79 => "011000000101001010001",
		80 => "011000000101001010001",
		81 => "011000001101010010011",
		82 => "011000001101010010011",
		83 => "011000001101010010011",
		84 => "011001100100011010000",
		85 => "011001100100011010000",
		86 => "011001100100011010000",
		87 => "011000010100101011000",
		88 => "011000010100101011000",
		89 => "011000010100101011000",
		90 => "001001111101111010000",
		91 => "001001111101111010000",
		92 => "001001111101111010000",
		93 => "011000001100110110110",
		94 => "011000001100110110110",
		95 => "011000001100110110110",
		96 => "011011101110001010000",
		97 => "011011101110001010000",
		98 => "011011101110001010000",
		99 => "001001100101101110000",
		100 => "001001100101101110000",
		101 => "001001100101101110000",
		102 => "011000001101100010011",
		103 => "011000001101100010011",
		104 => "011000001101100010011",
		105 => "011000001100101010110",
		106 => "011000001100101010110",
		107 => "011000001100101010110",
		108 => "011000101100101010100",
		109 => "011000101100101010100",
		110 => "011000101100101010100",
		111 => "011000000100111010001",
		112 => "011000000100111010001",
		113 => "011000000100111010001",
		114 => "011000000101011010010",
		115 => "011000000101011010010",
		116 => "011000000101011010010",
		117 => "001001111110001010000",
		118 => "001001111110001010000",
		119 => "001001111110001010000",
		120 => "001000011110001010110",
		121 => "001000011110001010110",
		122 => "001000011110001010110",
		123 => "001000010100111010110",
		124 => "001000010100111010110",
		125 => "001000010100111010110",
		126 => "011000001101100010011",
		127 => "011000001101100010011",
		128 => "011000001101100010011",
		129 => "001000111100011110011",
		130 => "001000111100011110011",
		131 => "001000111100011110011",
		132 => "011001000100001110100",
		133 => "011001000100001110100",
		134 => "011001000100001110100",
		135 => "011000000100111010001",
		136 => "011000000100111010001",
		137 => "011000000100111010001",
		138 => "011000000101011010010",
		139 => "011000000101011010010",
		140 => "011000000101011010010",
		141 => "001001111110001010000",
		142 => "001001111110001010000",
		143 => "001001111110001010000",
		144 => "011011101110001010000",
		145 => "011011101110001010000",
		146 => "011011101110001010000",
		147 => "001001100101101110000",
		148 => "001001100101101110000",
		149 => "001001100101101110000",
		150 => "011000001101100010011",
		151 => "011000001101100010011",
		152 => "011000001101100010011",
		153 => "011000001100101010110",
		154 => "011000001100101010110",
		155 => "011000001100101010110",
		156 => "011000101100101010100",
		157 => "011000101100101010100",
		158 => "011000101100101010100",
		159 => "011000000100111010001",
		160 => "011000000100111010001",
		161 => "011000000100111010001",
		162 => "011000000101011010010",
		163 => "011000000101011010010",
		164 => "011000000101011010010",
		165 => "001001111110001010000",
		166 => "001001111110001010000",
		167 => "001001111110001010000",
		168 => "001000011110001010110",
		169 => "001000011110001010110",
		170 => "001000011110001010110",
		171 => "001000010100111010110",
		172 => "001000010100111010110",
		173 => "001000010100111010110",
		174 => "011000001101100010011",
		175 => "011000001101100010011",
		176 => "011000001101100010011",
		177 => "001000111100011110011",
		178 => "001000111100011110011",
		179 => "001000111100011110011",
		180 => "011001000100001110100",
		181 => "011001000100001110100",
		182 => "011001000100001110100",
		183 => "011000000100111010001",
		184 => "011000000100111010001",
		185 => "011000000100111010001",
		186 => "011000000101011010010",
		187 => "011000000101011010010",
		188 => "011000000101011010010",
		189 => "001001111110001010000",
		190 => "001001111110001010000",
		191 => "001001111110001010000",
		192 => "011000000101110011001",
		193 => "011000000101110011001",
		194 => "011000000101110011001",
		195 => "001011011100001010111",
		196 => "001011011100001010111",
		197 => "001011011100001010111",
		198 => "011000000101101010011",
		199 => "011000000101101010011",
		200 => "011000000101101010011",
		201 => "011000001110100010101",
		202 => "011000001110100010101",
		203 => "011000001110100010101",
		204 => "011000000101110011001",
		205 => "011000000101110011001",
		206 => "011000000101110011001",
		207 => "011000111100111010000",
		208 => "011000111100111010000",
		209 => "011000111100111010000",
		210 => "011000000101101010011",
		211 => "011000000101101010011",
		212 => "011000000101101010011",
		213 => "011000001110100010101",
		214 => "011000001110100010101",
		215 => "011000001110100010101",
		216 => "011000000101110011001",
		217 => "011000000101110011001",
		218 => "011000000101110011001",
		219 => "001011011100001010111",
		220 => "001011011100001010111",
		221 => "001011011100001010111",
		222 => "011000000101101010011",
		223 => "011000000101101010011",
		224 => "011000000101101010011",
		225 => "011000001110100010101",
		226 => "011000001110100010101",
		227 => "011000001110100010101",
		228 => "011000000101110011001",
		229 => "011000000101110011001",
		230 => "011000000101110011001",
		231 => "011000111100111010000",
		232 => "011000111100111010000",
		233 => "011000111100111010000",
		234 => "011000000101101010011",
		235 => "011000000101101010011",
		236 => "011000000101101010011",
		237 => "011000001110100010101",
		238 => "011000001110100010101",
		239 => "011000001110100010101",
		240 => "011000000101110011001",
		241 => "011000000101110011001",
		242 => "011000000101110011001",
		243 => "001011011100001010111",
		244 => "001011011100001010111",
		245 => "001011011100001010111",
		246 => "011000000101101010011",
		247 => "011000000101101010011",
		248 => "011000000101101010011",
		249 => "011000001110100010101",
		250 => "011000001110100010101",
		251 => "011000001110100010101",
		252 => "011000000101110011001",
		253 => "011000000101110011001",
		254 => "011000000101110011001",
		255 => "011000111100111010000",
		256 => "011000111100111010000",
		257 => "011000111100111010000",
		258 => "011000000101101010011",
		259 => "011000000101101010011",
		260 => "011000000101101010011",
		261 => "011000001110100010101",
		262 => "011000001110100010101",
		263 => "011000001110100010101",
		264 => "011000000101110011001",
		265 => "011000000101110011001",
		266 => "011000000101110011001",
		267 => "001011011100001010111",
		268 => "001011011100001010111",
		269 => "001011011100001010111",
		270 => "011000000101101010011",
		271 => "011000000101101010011",
		272 => "011000000101101010011",
		273 => "011000001110100010101",
		274 => "011000001110100010101",
		275 => "011000001110100010101",
		276 => "011000000101110011001",
		277 => "011000000101110011001",
		278 => "011000000101110011001",
		279 => "011000111100111010000",
		280 => "011000111100111010000",
		281 => "011000111100111010000",
		282 => "011000000101101010011",
		283 => "011000000101101010011",
		284 => "011000000101101010011",
		285 => "011000001110100010101",
		286 => "011000001110100010101",
		287 => "011000001110100010101",
		288 => "001010111100001010101",
		289 => "001010111100001010101",
		290 => "001010111100001010101",
		291 => "011001011100001010100",
		292 => "011001011100001010100",
		293 => "011001011100001010100",
		294 => "011010100100001010101",
		295 => "011010100100001010101",
		296 => "011010100100001010101",
		297 => "011010000100001110010",
		298 => "011010000100001110010",
		299 => "011010000100001110010",
		300 => "001010111100001010101",
		301 => "001010111100001010101",
		302 => "001010111100001010101",
		303 => "011001011100001010100",
		304 => "011001011100001010100",
		305 => "011001011100001010100",
		306 => "011010100100001010101",
		307 => "011010100100001010101",
		308 => "011010100100001010101",
		309 => "011010000100001110010",
		310 => "011010000100001110010",
		311 => "011010000100001110010",
		312 => "001010111100001010101",
		313 => "001010111100001010101",
		314 => "001010111100001010101",
		315 => "011001011100001010100",
		316 => "011001011100001010100",
		317 => "011001011100001010100",
		318 => "011010100100001010101",
		319 => "011010100100001010101",
		320 => "011010100100001010101",
		321 => "011010000100001110010",
		322 => "011010000100001110010",
		323 => "011010000100001110010",
		324 => "001010111100001010101",
		325 => "001010111100001010101",
		326 => "001010111100001010101",
		327 => "011001011100001010100",
		328 => "011001011100001010100",
		329 => "011001011100001010100",
		330 => "011010100100001010101",
		331 => "011010100100001010101",
		332 => "011010100100001010101",
		333 => "011010000100001110010",
		334 => "011010000100001110010",
		335 => "011010000100001110010",
		336 => "001010111100001010101",
		337 => "001010111100001010101",
		338 => "001010111100001010101",
		339 => "011001011100001010100",
		340 => "011001011100001010100",
		341 => "011001011100001010100",
		342 => "011010100100001010101",
		343 => "011010100100001010101",
		344 => "011010100100001010101",
		345 => "011010000100001110010",
		346 => "011010000100001110010",
		347 => "011010000100001110010",
		348 => "001010111100001010101",
		349 => "001010111100001010101",
		350 => "001010111100001010101",
		351 => "011001011100001010100",
		352 => "011001011100001010100",
		353 => "011001011100001010100",
		354 => "011010100100001010101",
		355 => "011010100100001010101",
		356 => "011010100100001010101",
		357 => "011010000100001110010",
		358 => "011010000100001110010",
		359 => "011010000100001110010",
		360 => "001010111100001010101",
		361 => "001010111100001010101",
		362 => "001010111100001010101",
		363 => "011001011100001010100",
		364 => "011001011100001010100",
		365 => "011001011100001010100",
		366 => "011010100100001010101",
		367 => "011010100100001010101",
		368 => "011010100100001010101",
		369 => "011010000100001110010",
		370 => "011010000100001110010",
		371 => "011010000100001110010",
		372 => "001010111100001010101",
		373 => "001010111100001010101",
		374 => "001010111100001010101",
		375 => "011001011100001010100",
		376 => "011001011100001010100",
		377 => "011001011100001010100",
		378 => "011010100100001010101",
		379 => "011010100100001010101",
		380 => "011010100100001010101",
		381 => "011010000100001110010",
		382 => "011010000100001110010",
		383 => "011010000100001110010",
		384 => "011000001101100010011",
		385 => "011000001101100010011",
		386 => "011000001101100010011",
		387 => "011000001101100010011",
		388 => "011000001101100010011",
		389 => "011000001101100010011",
		390 => "011000001101100010011",
		391 => "011000001101100010011",
		392 => "011000001101100010011",
		393 => "011000001101100010011",
		394 => "011000001101100010011",
		395 => "011000001101100010011",
		396 => "011000001101100010011",
		397 => "011000001101100010011",
		398 => "011000001101100010011",
		399 => "011000001101100010011",
		400 => "011000001101100010011",
		401 => "011000001101100010011",
		402 => "011000001101100010011",
		403 => "011000001101100010011",
		404 => "011000001101100010011",
		405 => "011000001101100010011",
		406 => "011000001101100010011",
		407 => "011000001101100010011",
		408 => "011000001101100010011",
		409 => "011000001101100010011",
		410 => "011000001101100010011",
		411 => "011000001101100010011",
		412 => "011000001101100010011",
		413 => "011000001101100010011",
		414 => "011000001101100010011",
		415 => "011000001101100010011",
		416 => "011000001101100010011",
		417 => "011000001101100010011",
		418 => "011000001101100010011",
		419 => "011000001101100010011",
		420 => "011000001101100010011",
		421 => "011000001101100010011",
		422 => "011000001101100010011",
		423 => "011000001101100010011",
		424 => "011000001101100010011",
		425 => "011000001101100010011",
		426 => "011000001101100010011",
		427 => "011000001101100010011",
		428 => "011000001101100010011",
		429 => "011000001101100010011",
		430 => "011000001101100010011",
		431 => "011000001101100010011",
		432 => "011000001101100010011",
		433 => "011000001101100010011",
		434 => "011000001101100010011",
		435 => "011000001101100010011",
		436 => "011000001101100010011",
		437 => "011000001101100010011",
		438 => "011000001101100010011",
		439 => "011000001101100010011",
		440 => "011000001101100010011",
		441 => "011000001101100010011",
		442 => "011000001101100010011",
		443 => "011000001101100010011",
		444 => "011000001101100010011",
		445 => "011000001101100010011",
		446 => "011000001101100010011",
		447 => "011000001101100010011",
		448 => "011000001101100010011",
		449 => "011000001101100010011",
		450 => "011000001101100010011",
		451 => "011000001101100010011",
		452 => "011000001101100010011",
		453 => "011000001101100010011",
		454 => "011000001101100010011",
		455 => "011000001101100010011",
		456 => "011000001101100010011",
		457 => "011000001101100010011",
		458 => "011000001101100010011",
		459 => "011000001101100010011",
		460 => "011000001101100010011",
		461 => "011000001101100010011",
		462 => "011000001101100010011",
		463 => "011000001101100010011",
		464 => "011000001101100010011",
		465 => "011000001101100010011",
		466 => "011000001101100010011",
		467 => "011000001101100010011",
		468 => "011000001101100010011",
		469 => "011000001101100010011",
		470 => "011000001101100010011",
		471 => "011000001101100010011",
		472 => "011000001101100010011",
		473 => "011000001101100010011",
		474 => "011000001101100010011",
		475 => "011000001101100010011",
		476 => "011000001101100010011",
		477 => "011000001101100010011",
		478 => "011000001101100010011",
		479 => "011000001101100010011",
		480 => "011001100100001110001",
		481 => "011001100100001110001",
		482 => "011001100100001110001",
		483 => "011001100100001110001",
		484 => "011001100100001110001",
		485 => "011001100100001110001",
		486 => "011001100100001110001",
		487 => "011001100100001110001",
		488 => "011001100100001110001",
		489 => "011001100100001110001",
		490 => "011001100100001110001",
		491 => "011001100100001110001",
		492 => "011001100100001110001",
		493 => "011001100100001110001",
		494 => "011001100100001110001",
		495 => "011001100100001110001",
		496 => "011001100100001110001",
		497 => "011001100100001110001",
		498 => "011001100100001110001",
		499 => "011001100100001110001",
		500 => "011001100100001110001",
		501 => "011001100100001110001",
		502 => "011001100100001110001",
		503 => "011001100100001110001",
		504 => "011001100100001110001",
		505 => "011001100100001110001",
		506 => "011001100100001110001",
		507 => "011001100100001110001",
		508 => "011001100100001110001",
		509 => "011001100100001110001",
		510 => "011001100100001110001",
		511 => "011001100100001110001",
		512 => "011001100100001110001",
		513 => "011001100100001110001",
		514 => "011001100100001110001",
		515 => "011001100100001110001",
		516 => "011001100100001110001",
		517 => "011001100100001110001",
		518 => "011001100100001110001",
		519 => "011001100100001110001",
		520 => "011001100100001110001",
		521 => "011001100100001110001",
		522 => "011001100100001110001",
		523 => "011001100100001110001",
		524 => "011001100100001110001",
		525 => "011001100100001110001",
		526 => "011001100100001110001",
		527 => "011001100100001110001",
		528 => "011001100100001110001",
		529 => "011001100100001110001",
		530 => "011001100100001110001",
		531 => "011001100100001110001",
		532 => "011001100100001110001",
		533 => "011001100100001110001",
		534 => "011001100100001110001",
		535 => "011001100100001110001",
		536 => "011001100100001110001",
		537 => "011001100100001110001",
		538 => "011001100100001110001",
		539 => "011001100100001110001",
		540 => "011001100100001110001",
		541 => "011001100100001110001",
		542 => "011001100100001110001",
		543 => "011001100100001110001",
		544 => "011001100100001110001",
		545 => "011001100100001110001",
		546 => "011001100100001110001",
		547 => "011001100100001110001",
		548 => "011001100100001110001",
		549 => "011001100100001110001",
		550 => "011001100100001110001",
		551 => "011001100100001110001",
		552 => "011001100100001110001",
		553 => "011001100100001110001",
		554 => "011001100100001110001",
		555 => "011001100100001110001",
		556 => "011001100100001110001",
		557 => "011001100100001110001",
		558 => "011001100100001110001",
		559 => "011001100100001110001",
		560 => "011001100100001110001",
		561 => "011001100100001110001",
		562 => "011001100100001110001",
		563 => "011001100100001110001",
		564 => "011001100100001110001",
		565 => "011001100100001110001",
		566 => "011001100100001110001",
		567 => "011001100100001110001",
		568 => "011001100100001110001",
		569 => "011001100100001110001",
		570 => "011001100100001110001",
		571 => "011001100100001110001",
		572 => "011001100100001110001",
		573 => "011001100100001110001",
		574 => "011001100100001110001",
		575 => "011001100100001110001",
		576 => "011000101100100010101",
		577 => "011000101100100010101",
		578 => "011000101100100010101",
		579 => "011000101100100010101",
		580 => "011000101100100010101",
		581 => "011000101100100010101",
		582 => "011000101100100010101",
		583 => "011000101100100010101",
		584 => "011000101100100010101",
		585 => "011000101100100010101",
		586 => "011000101100100010101",
		587 => "011000101100100010101",
		588 => "011000101100100010101",
		589 => "011000101100100010101",
		590 => "011000101100100010101",
		591 => "011000101100100010101",
		592 => "011000101100100010101",
		593 => "011000101100100010101",
		594 => "011000101100100010101",
		595 => "011000101100100010101",
		596 => "011000101100100010101",
		597 => "011000101100100010101",
		598 => "011000101100100010101",
		599 => "011000101100100010101",
		600 => "011000101100100010101",
		601 => "011000101100100010101",
		602 => "011000101100100010101",
		603 => "011000101100100010101",
		604 => "011000101100100010101",
		605 => "011000101100100010101",
		606 => "011000101100100010101",
		607 => "011000101100100010101",
		608 => "011000101100100010101",
		609 => "011000101100100010101",
		610 => "011000101100100010101",
		611 => "011000101100100010101",
		612 => "011000101100100010101",
		613 => "011000101100100010101",
		614 => "011000101100100010101",
		615 => "011000101100100010101",
		616 => "011000101100100010101",
		617 => "011000101100100010101",
		618 => "011000101100100010101",
		619 => "011000101100100010101",
		620 => "011000101100100010101",
		621 => "011000101100100010101",
		622 => "011000101100100010101",
		623 => "011000101100100010101",
		624 => "011000101100100010101",
		625 => "011000101100100010101",
		626 => "011000101100100010101",
		627 => "011000101100100010101",
		628 => "011000101100100010101",
		629 => "011000101100100010101",
		630 => "011000101100100010101",
		631 => "011000101100100010101",
		632 => "011000101100100010101",
		633 => "011000101100100010101",
		634 => "011000101100100010101",
		635 => "011000101100100010101",
		636 => "011000101100100010101",
		637 => "011000101100100010101",
		638 => "011000101100100010101",
		639 => "011000101100100010101",
		640 => "011000101100100010101",
		641 => "011000101100100010101",
		642 => "011000101100100010101",
		643 => "011000101100100010101",
		644 => "011000101100100010101",
		645 => "011000101100100010101",
		646 => "011000101100100010101",
		647 => "011000101100100010101",
		648 => "011000101100100010101",
		649 => "011000101100100010101",
		650 => "011000101100100010101",
		651 => "011000101100100010101",
		652 => "011000101100100010101",
		653 => "011000101100100010101",
		654 => "011000101100100010101",
		655 => "011000101100100010101",
		656 => "011000101100100010101",
		657 => "011000101100100010101",
		658 => "011000101100100010101",
		659 => "011000101100100010101",
		660 => "011000101100100010101",
		661 => "011000101100100010101",
		662 => "011000101100100010101",
		663 => "011000101100100010101",
		664 => "011000101100100010101",
		665 => "011000101100100010101",
		666 => "011000101100100010101",
		667 => "011000101100100010101",
		668 => "011000101100100010101",
		669 => "011000101100100010101",
		670 => "011000101100100010101",
		671 => "011000101100100010101",
		672 => "011000101100100110010",
		673 => "011000101100100110010",
		674 => "011000101100100110010",
		675 => "011000101100100110010",
		676 => "011000101100100110010",
		677 => "011000101100100110010",
		678 => "011000101100100110010",
		679 => "011000101100100110010",
		680 => "011000101100100110010",
		681 => "011000101100100110010",
		682 => "011000101100100110010",
		683 => "011000101100100110010",
		684 => "011000101100100110010",
		685 => "011000101100100110010",
		686 => "011000101100100110010",
		687 => "011000101100100110010",
		688 => "011000101100100110010",
		689 => "011000101100100110010",
		690 => "011000101100100110010",
		691 => "011000101100100110010",
		692 => "011000101100100110010",
		693 => "011000101100100110010",
		694 => "011000101100100110010",
		695 => "011000101100100110010",
		696 => "011000101100100110010",
		697 => "011000101100100110010",
		698 => "011000101100100110010",
		699 => "011000101100100110010",
		700 => "011000101100100110010",
		701 => "011000101100100110010",
		702 => "011000101100100110010",
		703 => "011000101100100110010",
		704 => "011000101100100110010",
		705 => "011000101100100110010",
		706 => "011000101100100110010",
		707 => "011000101100100110010",
		708 => "011000101100100110010",
		709 => "011000101100100110010",
		710 => "011000101100100110010",
		711 => "011000101100100110010",
		712 => "011000101100100110010",
		713 => "011000101100100110010",
		714 => "011000101100100110010",
		715 => "011000101100100110010",
		716 => "011000101100100110010",
		717 => "011000101100100110010",
		718 => "011000101100100110010",
		719 => "011000101100100110010",
		720 => "011000101100100110010",
		721 => "011000101100100110010",
		722 => "011000101100100110010",
		723 => "011000101100100110010",
		724 => "011000101100100110010",
		725 => "011000101100100110010",
		726 => "011000101100100110010",
		727 => "011000101100100110010",
		728 => "011000101100100110010",
		729 => "011000101100100110010",
		730 => "011000101100100110010",
		731 => "011000101100100110010",
		732 => "011000101100100110010",
		733 => "011000101100100110010",
		734 => "011000101100100110010",
		735 => "011000101100100110010",
		736 => "011000101100100110010",
		737 => "011000101100100110010",
		738 => "011000101100100110010",
		739 => "011000101100100110010",
		740 => "011000101100100110010",
		741 => "011000101100100110010",
		742 => "011000101100100110010",
		743 => "011000101100100110010",
		744 => "011000101100100110010",
		745 => "011000101100100110010",
		746 => "011000101100100110010",
		747 => "011000101100100110010",
		748 => "011000101100100110010",
		749 => "011000101100100110010",
		750 => "011000101100100110010",
		751 => "011000101100100110010",
		752 => "011000101100100110010",
		753 => "011000101100100110010",
		754 => "011000101100100110010",
		755 => "011000101100100110010",
		756 => "011000101100100110010",
		757 => "011000101100100110010",
		758 => "011000101100100110010",
		759 => "011000101100100110010",
		760 => "011000101100100110010",
		761 => "011000101100100110010",
		762 => "011000101100100110010",
		763 => "011000101100100110010",
		764 => "011000101100100110010",
		765 => "011000101100100110010",
		766 => "011000101100100110010",
		767 => "011000101100100110010",
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