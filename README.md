# Analisi del Divario Salariale di Genere in Europa (EU-SILC 2022)

## 📝 Sommario
- [Descrizione del Progetto](#descrizione-del-progetto)
- [Obiettivi del Progetto](#obiettivi-del-progetto)
- [Dati e Metodologia](#dati-e-metodologia)
- [Risultati Principali](#risultati-principali)
- [Installazione e Utilizzo](#installazione-e-utilizzo)
- [Autori](#autori)
- [Riferimenti](#riferimenti)
- [Limitazioni e Direzioni Future](#limitazioni-e-direzioni-future)

---

## Descrizione del Progetto
Questo progetto esplora il **gender pay gap** in Europa utilizzando i dati dell'indagine **EU-SILC 2022** (campione di 169.277 lavoratori dipendenti). L'obiettivo principale è indagare come variabili socio-demografiche, come il genere, la nazione di residenza, il livello di istruzione, lo stato civile e il tipo di occupazione, influenzano le retribuzioni. Lo studio include l'applicazione di modelli di regressione multipla, analisi interattive e visualizzazioni per comparare le disparità salariali tra paesi e categorie demografiche.

---

## Obiettivi del Progetto
1. **Analizzare il gender pay gap** in diversi paesi europei.
2. **Esaminare l'impatto del matrimonio e della prole** sulle retribuzioni femminili.
3. **Confrontare le disparità salariali** tra diverse nazioni e settori occupazionali.
4. **Esplorare l'effetto di variabili socio-demografiche** come età, istruzione e stato civile sul salario.

---

## Dati e Metodologia

### Dati
- **Fonte dati**: EU-SILC 2022 (European Union Statistics on Income and Living Conditions).
- **Campione**: 169.277 lavoratori dipendenti.
  
### Strumenti
- Analisi eseguita in **RStudio** utilizzando pacchetti come:
  - `arm`
  - `dplyr`
  - `ggplot2`

### Metodologia
1. **Regressione lineare logaritmica** per modellare i salari e analizzare le variabili influenti.
2. Controllo delle variabili socio-demografiche: nazione, istruzione, età, stato civile e tipo di occupazione.
3. **Interazioni** tra genere e altre variabili (nazione, stato civile) per indagini più approfondite.
4. **Visualizzazioni interattive**:
    - Grafici a dispersione
    - Boxplot
    - Grafici a barre per comparare i risultati

---

## Risultati Principali

### 1. **Divario Salariale di Genere**
- **Italia**: Differenza del **19,7%** a sfavore delle donne.
- **Germania**: Differenza del **30,2%**.
- **Portogallo**: Differenza minima del **3,9%**.

### 2. **Impatto del Matrimonio**
- Gli **uomini sposati** guadagnano in media il **12,6%** in più rispetto ai celibi.
- Per le **donne sposate**, l'influenza del matrimonio sui guadagni è minima (+/- 0,7%).
- Il **divario salariale** tra uomini e donne sposati è pari al **25,9%**.

### 3. **Altri Fattori Significativi**
- **Età**: Il picco salariale si raggiunge intorno ai **50-51 anni**.
- **Istruzione**: Le persone con una laurea triennale guadagnano in media **14,5%** in più rispetto a chi ha solo un'istruzione secondaria.
- **Occupazione**: Settori tecnico-scientifici e dirigenziali presentano salari mediamente più elevati rispetto ad altri settori.

---

## Installazione e Utilizzo

### 1. **Prerequisiti**
- R (versione ≥ 4.0) e **RStudio**.
- Pacchetti R: `arm`, `dplyr`, `ggplot2`.

### 2. **Istruzioni**
- Clonare la repository:
  ```bash
  git clone https://github.com/sorrentini.2002/Analisi-del-Divario-Salariale-di-Genere-in-Europa---EU-SILC-2022.git
  ```
Installare i pacchetti richiesti con il comando:


install.packages(c("arm", "dplyr", "ggplot2"))
Eseguire analysis.R per replicare l'analisi e generare i grafici e le tabelle.

## Autori
Gruppo di Ricerca:

- Matteo Sorrentini

- Simone Santonati

- Federico Trionfetti

## Riferimenti
- Goldin, C. (2023). "Studi sul divario salariale di genere" (Premio Nobel per l'Economia).

- Eurostat: EU-SILC 2022 Survey.

- Letteratura econometrica su salari e variabili socio-demografiche.

## Limitazioni e Direzioni Future
Limitazioni
L'analisi è basata su dati cross-sectional (non longitudinali) e potrebbe essere soggetta a variabili omesse.

## Future Ricerche
Analisi per paese specifico, impatto della maternità, confronto con dati di anni precedenti, e analisi longitudinali per esaminare i cambiamenti nel tempo.
