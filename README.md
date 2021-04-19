# boleto_mask

A Mask for boletos

## Getting Started

```
TextField(
	...,
	inputFormatters: [
		BoletoMask(),
	]
);
```

Using this mask, for any boleto started with 8 it will be masked like:

8############################################### -> 8########## # ########### # ########### # ########### #

for the other cases:

############################################### -> #####.##### #####.###### #####.###### # ##############

## Other uses

```
final barCode = '11111111111111111111111111111111111111111111111';
final maskedText = BoletoMask(barCode).getMaskedText(); // 11111.11111 11111.111111 11111.111111 1 11111111111111
```

