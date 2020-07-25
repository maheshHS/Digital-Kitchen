module ApplicationHelper

    def link_to_add_row( name, f, association, **args)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            a = 0 
            render(association.to_s.singularize, b: builder, itm_q: a)
            #debugger
            #text_field(association.to_s.singularize,:merge_table_ids, size: 20, class: 'prod_input prod_inp_quant')
            #text_field(, options = {}) 
            #text_field( , label: false, value: 0, class:"prod_input prod_inp_quant")
        end
        link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
    end

    # def link_to_add_conversion( name)
    #     new_object = Conversion.new
    #     id = new_object.object_id
    #     #debugger
    #     fields = fields_for("add_conversions[#{id}]", new_object) do |builder|
    #         render("conversion_fields", f: builder)
    #     end
    #     link_to(name, '#', class: "add_conversion", data: {id: id, fields: fields.gsub("\n", "")})
    # end
end

