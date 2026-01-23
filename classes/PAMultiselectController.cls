/* Name        :   PAMultiselectController
* Description  :   This class acts as a to retrieve selected default currency and selected default Uom values in pick list.
* Author         :   Infosys Limited
* Created Date :   23-04-2014
*****************************************************************************************************************
<JM20140425>
Last Modified By    :   Jawahar Muthu Adaikalam
Last Modified Date  :   24 April 2014
Description         :   CAPITAL PROJECT
*****************************************************************************************************************/

//<JM20140425> STARTS
public with sharing class PAMultiselectController {
	
	// SelectOption lists for public consumption
    public SelectOption[] leftOptions { get; set; }
    public SelectOption[] rightOptions { get; set; }
    
    
    private void setOptions(SelectOption[] options, String value) {
        options.clear();
        String[] parts = value.split('&');
        for (Integer i=0; i<parts.size()/2; i++) {
            options.add(new SelectOption(EncodingUtil.urlDecode(parts[i*2], 'UTF-8'), 
              EncodingUtil.urlDecode(parts[(i*2)+1], 'UTF-8')));
        }
    }
    
    
    public String leftOptionsHidden { get; set {
           leftOptionsHidden = value;
           setOptions(leftOptions, value);
        }
    }
    
    
    public String rightOptionsHidden { get; set {
           rightOptionsHidden = value;
           setOptions(rightOptions, value);
        }
    }

}
 //<JM20140425> ENDS