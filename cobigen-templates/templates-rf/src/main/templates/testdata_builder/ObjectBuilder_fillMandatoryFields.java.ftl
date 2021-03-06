<#include '/makros.ftl'>
package ${variables.rootPackage}.common.builders<#if variables.subPackage != "null">.${variables.subPackage}</#if>;

public class ${pojo.name}Builder {

	/**
	 * Fills all mandatory fields by default. (will be overwritten on re-generation)
	 */
    private void fillMandatoryFields() {
	    <#list pojo.methodAccessibleFields as attr>
		<#if (attr.annotations.javax_validation_constraints_NotNull)?has_content
		  || (attr.annotations.javax_persistence_Column.nullable?has_content
		   && attr.annotations.javax_persistence_Column.nullable == "false")>
		<@callNotNullPropertyWithDefaultValue attr=attr/>

		</#if>
	    </#list>
    }

}
