public class PAException extends Exception{
	public ApexPages.Severity severity {get{
		if(severity == null)
		{
			severity= ApexPages.Severity.ERROR;
		}
		return severity;
	}set;}

	public PAException(String message, ApexPages.Severity severity) {
		this(message);
		this.severity = severity;
	}
}