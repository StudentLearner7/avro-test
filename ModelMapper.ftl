public class ModelMapper {

    <#foreach entity in entities>
    public ${entity.name} toEntity(${entity.dtoPackage}.${entity.name}DTO dto) {
        if (dto == null) {
            return null;
        }

        ${entity.name} entity = new ${entity.name}();

        <#foreach field in entity.fields>
            <#if field.isPrimitive>
        entity.set${field.name?cap_first}(dto.get${field.name?cap_first}());
            <#else>
                <#-- Example for converting non-primitive types: -->
                <#if field.type == "Department">
        entity.set${field.name?cap_first}(toEntity(dto.get${field.name?cap_first}()));
                <#else>
                    <#-- Handle other non-primitive types as needed -->
        entity.set${field.name?cap_first}(dto.get${field.name?cap_first}()); // Adjust as needed
                </#if>
            </#if>
        </#foreach>

        return entity;
    }

    public ${entity.dtoPackage}.${entity.name}DTO toDTO(${entity.name} entity) {
        if (entity == null) {
            return null;
        }

        ${entity.dtoPackage}.${entity.name}DTO dto = new ${entity.dtoPackage}.${entity.name}DTO();

        <#foreach field in entity.fields>
            <#if field.isPrimitive>
        dto.set${field.name?cap_first}(entity.get${field.name?cap_first}());
            <#else>
                <#-- Example for converting non-primitive types: -->
                <#if field.type == "Department">
        dto.set${field.name?cap_first}(toDTO(entity.get${field.name?cap_first}()));
                <#else>
                    <#-- Handle other non-primitive types as needed -->
        dto.set${field.name?cap_first}(entity.get${field.name?cap_first}()); // Adjust as needed
                </#if>
            </#if>
        </#foreach>

        return dto;
    }
    </#foreach>
}
