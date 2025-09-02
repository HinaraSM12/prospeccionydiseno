{include file= "../masterPage/template.tpl"}
{include file= "../layouts/inc/header_typep_en.tpl"}

<main class="detalle">
    <h1 class="text-center">Sequences Filter</h1>

    {include file= "../filterPep/searchComponent_en.tpl"}
    {include file= "../filterPep/searchStatisticsComponent_en.tpl"}
    {include file= "../filterPep/sequencesComponent_en.tpl"}

</main>

{include file= "../layouts/inc/footer.tpl"}

<script src="{URL::to('/')}/assets/js/filter_seq.js"></script>
<script type="text/javascript">

      let sequences = {$sequences|@json_encode};
      aminoacids_list = ['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y'];
      function testFunction() {
      }

      function downloadSequences() {
        let sequenceInput = $("#inputTextSequence").val().toUpperCase().replace(/X/gi, '[A-Z]');
        let sequenceIgnoreInput = $("#inputTextIgnoreSequence").val().toUpperCase().replace(/X/gi, '[A-Z]');
        

        let minChargeInput = $("#minCharge").val();
        let maxChargeInput = $("#maxCharge").val();
        let minIsoelectricInput = $("#minIsoelectric").val();
        let maxIsoelectricInput = $("#maxIsoelectric").val();
        let minHidrofobicInput = $("#minHidrofobic").val();
        let maxHidrofobicInput = $("#maxHidrofobic").val();
        let minBomanInput = $("#minBoman").val();
        let maxBomanInput = $("#maxBoman").val();
        let minMomentInput = $("#minMoment").val();
        let maxMomentInput = $("#maxMoment").val();

        let sequenceCharge = 0;
        let sequenceIsoelectric = 0;
        let sequenceHidrofobic = 0;
        let sequenceBoman = 0;
        let sequenceMomment = 0;


        let content = "";
        let filteredSequences = sequences.filter(function(sequenceItem){
          return sequenceItem['sequence'].match(sequenceInput);
        })
        
        //Ignore Sequence
        if(sequenceIgnoreInput){
          filteredSequences = filteredSequences.filter(function(sequenceItem){
            let ignore_sequences = sequenceIgnoreInput.split(",");
            
            for(i = 0; i < ignore_sequences.length; i++){
              console.log(ignore_sequences[i]);
              if(ignore_sequences[i] != "" && sequenceItem['sequence'].match(ignore_sequences[i])){
                return false;
              }
            }
            return true;
            //return !sequenceItem['sequence'].match(sequenceIgnoreInput);
          });
        }

        //Apply Charge filter
        if (minChargeInput && maxChargeInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceCharge = getCharge(sequenceItem['sequence']);
            if(sequenceCharge > minChargeInput && sequenceCharge < maxChargeInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Isoelectric filter
        if (minIsoelectricInput && maxIsoelectricInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceIsoelectric = getIsoEle(sequenceItem['sequence']);
            if(sequenceIsoelectric > minIsoelectricInput && sequenceIsoelectric < maxIsoelectricInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Hidrofobic Filter
        if (minHidrofobicInput && maxHidrofobicInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceHidrofobic = getHidrof(sequenceItem['sequence']);
            if(sequenceHidrofobic > minHidrofobicInput && sequenceHidrofobic < maxHidrofobicInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Boman Filter
        if (minBomanInput && maxBomanInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceBoman = getBoman(sequenceItem['sequence']);
            if(sequenceBoman > minBomanInput && sequenceBoman < maxBomanInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Moment Filter
        if (minMomentInput && maxMomentInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceMoment = getMoment(sequenceItem['sequence']);
            if(sequenceMoment > minMomentInput && sequenceMoment < maxMomentInput){
              return sequenceItem['sequence'];
            }
          });
        }

        let csvContent = "data:text/csv;charset=utf-8,";
        csvContent+="header, sequence\n";
        filteredSequences.forEach(function(sequenceItem){
            let row = sequenceItem['header'].slice(1, -2).replaceAll(",",";") + ", " + sequenceItem['sequence'];
            csvContent+= row;
        });

        var encodedUri = encodeURI(csvContent);
        var link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", "sequences.csv");
        document.body.appendChild(link); // Required for FF

        link.click();


      }

     function downloadSequencesFasta() {
        let sequenceInput = $("#inputTextSequence").val().toUpperCase().replace(/X/gi, '[A-Z]');
        let sequenceIgnoreInput = $("#inputTextIgnoreSequence").val().toUpperCase().replace(/X/gi, '[A-Z]');


        let minChargeInput = $("#minCharge").val();
        let maxChargeInput = $("#maxCharge").val();
        let minIsoelectricInput = $("#minIsoelectric").val();
        let maxIsoelectricInput = $("#maxIsoelectric").val();
        let minHidrofobicInput = $("#minHidrofobic").val();
        let maxHidrofobicInput = $("#maxHidrofobic").val();
        let minBomanInput = $("#minBoman").val();
        let maxBomanInput = $("#maxBoman").val();
        let minMomentInput = $("#minMoment").val();
        let maxMomentInput = $("#maxMoment").val();

        let sequenceCharge = 0;
        let sequenceIsoelectric = 0;
        let sequenceHidrofobic = 0;
        let sequenceBoman = 0;
        let sequenceMomment = 0;


        let content = "";
        let filteredSequences = sequences.filter(function(sequenceItem){
          return sequenceItem['sequence'].match(sequenceInput);
        })
        
        //Ignore Sequence
        if(sequenceIgnoreInput){
          filteredSequences = filteredSequences.filter(function(sequenceItem){
            let ignore_sequences = sequenceIgnoreInput.split(",");
            
            for(i = 0; i < ignore_sequences.length; i++){
              console.log(ignore_sequences[i]);
              if(ignore_sequences[i] != "" && sequenceItem['sequence'].match(ignore_sequences[i])){
                return false;
              }
            }
            return true;
            //return !sequenceItem['sequence'].match(sequenceIgnoreInput);
          });
        }

        //Apply Charge filter
        if (minChargeInput && maxChargeInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceCharge = getCharge(sequenceItem['sequence']);
            if(sequenceCharge > minChargeInput && sequenceCharge < maxChargeInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Isoelectric filter
        if (minIsoelectricInput && maxIsoelectricInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceIsoelectric = getIsoEle(sequenceItem['sequence']);
            if(sequenceIsoelectric > minIsoelectricInput && sequenceIsoelectric < maxIsoelectricInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Hidrofobic Filter
        if (minHidrofobicInput && maxHidrofobicInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceHidrofobic = getHidrof(sequenceItem['sequence']);
            if(sequenceHidrofobic > minHidrofobicInput && sequenceHidrofobic < maxHidrofobicInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Boman Filter
        if (minBomanInput && maxBomanInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceBoman = getBoman(sequenceItem['sequence']);
            if(sequenceBoman > minBomanInput && sequenceBoman < maxBomanInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Moment Filter
        if (minMomentInput && maxMomentInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceMoment = getMoment(sequenceItem['sequence']);
            if(sequenceMoment > minMomentInput && sequenceMoment < maxMomentInput){
              return sequenceItem['sequence'];
            }
          });
        }

        let fastaContent = "data:text/csv;charset=utf-8,";
        
        filteredSequences.forEach(function(sequenceItem){
            let row = sequenceItem['header'] + sequenceItem['sequence'];
            fastaContent+= row;
        });

        var encodedUri = encodeURI(fastaContent);
        var link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", "sequences.fasta");
        document.body.appendChild(link); // Required for FF

        link.click();


      }


      function findSequences() {
        let sequenceInput = $("#inputTextSequence").val().toUpperCase().replace(/X/gi, '[A-Z]');
        let sequenceIgnoreInput = $("#inputTextIgnoreSequence").val().toUpperCase().replace(/X/gi, '[A-Z]');
        console.log(sequenceIgnoreInput);

        let minChargeInput = $("#minCharge").val();
        let maxChargeInput = $("#maxCharge").val();
        let minIsoelectricInput = $("#minIsoelectric").val();
        let maxIsoelectricInput = $("#maxIsoelectric").val();
        let minHidrofobicInput = $("#minHidrofobic").val();
        let maxHidrofobicInput = $("#maxHidrofobic").val();
        let minBomanInput = $("#minBoman").val();
        let maxBomanInput = $("#maxBoman").val();
        let minMomentInput = $("#minMoment").val();
        let maxMomentInput = $("#maxMoment").val();

        let sequenceCharge = 0;
        let sequenceIsoelectric = 0;
        let sequenceHidrofobic = 0;
        let sequenceBoman = 0;
        let sequenceMomment = 0;


        let content = "";
        let filteredSequences = sequences.filter(function(sequenceItem){
          return sequenceItem['sequence'].match(sequenceInput);
        })
        
        //Ignore Sequence
        if(sequenceIgnoreInput){
          filteredSequences = filteredSequences.filter(function(sequenceItem){
            let ignore_sequences = sequenceIgnoreInput.split(",");
            
            for(i = 0; i < ignore_sequences.length; i++){
              console.log(ignore_sequences[i]);
              if(ignore_sequences[i] != "" && sequenceItem['sequence'].match(ignore_sequences[i])){
                return false;
              }
            }
            return true;
            //return !sequenceItem['sequence'].match(sequenceIgnoreInput);
          });
        }

        //Apply Charge filter
        if (minChargeInput && maxChargeInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceCharge = getCharge(sequenceItem['sequence']);
            if(sequenceCharge > minChargeInput && sequenceCharge < maxChargeInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Isoelectric filter
        if (minIsoelectricInput && maxIsoelectricInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceIsoelectric = getIsoEle(sequenceItem['sequence']);
            if(sequenceIsoelectric > minIsoelectricInput && sequenceIsoelectric < maxIsoelectricInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Hidrofobic Filter
        if (minHidrofobicInput && maxHidrofobicInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceHidrofobic = getHidrof(sequenceItem['sequence']);
            if(sequenceHidrofobic > minHidrofobicInput && sequenceHidrofobic < maxHidrofobicInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Boman Filter
        if (minBomanInput && maxBomanInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceBoman = getBoman(sequenceItem['sequence']);
            if(sequenceBoman > minBomanInput && sequenceBoman < maxBomanInput){
              return sequenceItem['sequence'];
            }
          });
        }

        //Apply Moment Filter
        if (minMomentInput && maxMomentInput){
          filteredSequences = filteredSequences.filter((sequenceItem) => {
            sequenceMoment = getMoment(sequenceItem['sequence']);
            if(sequenceMoment > minMomentInput && sequenceMoment < maxMomentInput){
              return sequenceItem['sequence'];
            }
          });
        }

        let allAminoacids = "";

        filteredSequences.forEach(function(sequenceItem){
          content += "<tr>"
          content += "<td>" + sequenceItem['header'] + "</td>"
          content += "<td>" + addHighLights(sequenceItem['sequence'], sequenceInput) + "</td>"
          content += "</tr>"

          allAminoacids += sequenceItem['sequence'];
        })

        // Sequence Table
        $('#archivoInfoTable tbody').html(content); 
        
        // Statistics Table
        let percentageSearch = ((filteredSequences.length*100)/sequences.length)

        $('#searchNumber').html(filteredSequences.length);
        $('#searchPercentage').html(percentageSearch.toFixed(2));
        $('#aminoPercentage').html( getMostUsedAminoacids(allAminoacids, aminoacids_list));
        
      }

      $('#inputTextSequence').on('keyup keypress', function(e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) { 
          findSequences()
        }
      });


      function validateKey(event){
        var chart = event.key.toUpperCase();
        var key = event.keyCode || event.charCode;
        if( key == 8 || key == 46 || key == 88)
          return true;
        if(aminoacids_list.indexOf(chart) != -1 || chart == 'X'){
          return true;
        } else {
          return false;
        }
      }

      
      function validateKeyIgnore(event){
        var chart = event.key.toUpperCase();
        var key = event.keyCode || event.charCode;
        if( key == 8 || key == 44 || key == 88)
          return true;
        if(aminoacids_list.indexOf(chart) != -1 || chart == 'X'){
          return true;
        } else {
          return false;
        }
      }
    </script>
