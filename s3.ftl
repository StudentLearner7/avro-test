// ...

private ${entityName} toEntity(${entityName}DTO dto) {
    ${entityName} entity = new ${entityName}();
<#list fields as field>
    <#if field.type?ends_with("DTO")>
        entity.set${field.name?cap_first}(toEntity(dto.get${field.name?cap_first}()));
    <#else>
        entity.set${field.name?cap_first}(dto.get${field.name?cap_first}());
    </#if>
</#list>
    return entity;
}

private ${entityName}DTO toDTO(${entityName} entity) {
    ${entityName}DTO dto = new ${entityName}DTO();
<#list fields as field>
    <#if field.type?ends_with("DTO")>
        dto.set${field.name?cap_first}(toDTO(entity.get${field.name?cap_first}()));
    <#else>
        dto.set${field.name?cap_first}(entity.get${field.name?cap_first}());
    </#if>
</#list>
    return dto;
}

// ...

<#list nonPrimitiveFields as field>
private ${field.type} toEntity(${field.type}DTO dto) {
    ${field.type} entity = new ${field.type}();
<#list field.fields as subField>
    <#if subField.type?ends_with("DTO")>
        entity.set${subField.name?cap_first}(toEntity(dto.get${subField.name?cap_first}()));
    <#else>
        entity.set${subField.name?cap_first}(dto.get${subField.name?cap_first}());
    </#if>
</#list>
    return entity;
}

private ${field.type}DTO toDTO(${field.type} entity) {
    ${field.type}DTO dto = new ${field.type}DTO();
<#list field.fields as subField>
    <#if subField.type?ends_with("DTO")>
        dto.set${subField.name?cap_first}(toDTO(entity.get${subField.name?cap_first}()));
    <#else>
        dto.set${subField.name?cap_first}(entity.get${subField.name?cap_first}());
    </#if>
</#list>
    return dto;
}
</#list>
