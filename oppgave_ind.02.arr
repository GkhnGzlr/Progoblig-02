use context essentials2021
## Disse linjene inneholder modulene som kreves for å samhandle med Google Disk og relaterte datakilder.

include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source

## Disse linjene importerer komponent- og energikolonner fra et ark med navnet "kWh" fra en spesifikk Google Sheets-fil. bruker string-sanitiser til å konvertere energikolonnen fra tekst til tall.

ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer    
  end

## Disse linjene beregner energiforbruket på en daglig kjøretur i en bil med data fra oss.

energy-used-by-the-car = 10
daily-car-range = 50
distance-traveled-by-car = 25

energy-per-day =
( daily-car-range / distance-traveled-by-car ) *  energy-used-by-the-car

## Denne blokken inneholder en funksjon som konverterer energiverdien gitt som tekst til et tall, og where-blokken som bestemmer hvordan denne funksjonen skal oppføre seg.
                                 
fun energi-to-number(str :: String) -> Number:

  doc: "If s is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end

where:
  energi-to-number("") is 0
  energi-to-number("48") is 48
end

## Disse radene konverterer energidataene i tabellen kWh-wealthy-consumer-data til tall, beregner summen av disse dataene og legger deretter til den totale energiverdien i tabellen table-sum. Til slutt legges en rad fra tabellen table-sum til tabellen nytabell.

nytabell = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

total-energy = sum(nytabell, "energi")

table-sum = table: komponent :: String, energi :: Number
  row: "total-energy", total-energy
end
ny-row = get-row(table-sum, 0)
add-row(nytabell, ny-row)

## Denne raden oppretter et søylediagram ved hjelp av dataene fra verktøytabellen. Kolonnen "komponent" plasseres på x-aksen og kolonnen "energi" på y-aksen.
## Dette skriptet henter data om energiforbruk fra en Google Sheets-tabell, behandler og analyserer disse dataene, beregner en totalverdi, legger totalverdien til dataene og visualiserer disse dataene i et søylediagram. 

bar-chart(nytabell, "komponent", "energi")

