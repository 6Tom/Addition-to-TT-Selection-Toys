# ------------------------------------------------------------------------------------------------------------------------

# This is an additional file that does not belong to the original project.
# Its function is to add a feature: Batch convert "group copies" to components.

# What I did was just add an "until loop" to the original code to achieve batch conversion.
# All the credit and contributions come from Thomas Thomassen.

# The original project does not specify an open source license.
# https://github.com/thomthom/SelectionTools
# I temporarily specify that this script is licensed under the GNU GPL v2 license.
# https://www.gnu.org/licenses/old-licenses/gpl-2.0.html

# I haven't asked Thomas Thomassen yet, there may be changes in the future.
# Currently, feel free to redistribute or modify this script under the GNU GPL v2 license.

# 6Tom
# 2023.05.20
# https://github.com/6Tom

# ------------------------------------------------------------------------------------------------------------------------


require 'sketchup.rb'
require 'extensions.rb'
require 'tt_selection_toys\core.rb'


# ------------------------------------------------------------------------------------------------------------------------


module TT
    module Plugins
        module SelectionToys

            def self.batch_convert_group_copies_to_components

                # First, select only groups
                self.select(Sketchup::Group)

                model = Sketchup.active_model
                sel = model.selection
                self.start_operation('Batch Convert Copies to Components')

                # Batch convertion
                until sel.empty?

                    # --------------------------------------------------------------------------------
                    # All of these codes and comments come from the method: convert_group_copies_to_components
                    # They are all unmodified.

                    # Cache some properties to transfer
                    group_name = sel[0].name
                    group_lock = sel[0].locked?
                    # Find all the copies and make a prototype
                    groups = self.get_definition(sel[0]).instances
                    proto = groups[0].to_component
                    # Transfer some properties that where not converted
                    proto.name = group_name
                    proto.locked = group_lock

                    # Iterate through the rest of the copies
                    protodef = proto.definition
                    groups.each { | group |
                        next if group.deleted?
                        # Add a new component
                        new_comp          = group.parent.entities.add_instance(protodef, group.transformation)
                        new_comp.name     = group.name
                        new_comp.material = group.material
                        new_comp.layer    = group.layer
                        new_comp.hidden   = group.hidden?
                        new_comp.casts_shadows    = group.casts_shadows?
                        new_comp.receives_shadows = group.receives_shadows?
                        new_comp.locked   = group.locked?
                        # (!) Glued to, attributes?
                        # Delete the old group
                        group.locked = false
                        group.parent.entities.erase_entities(group)
                    }

                    # --------------------------------------------------------------------------------

                end # until

                model.commit_operation
                Sketchup.set_status_text(protodef.instances.length.to_s + ' group copies converted into components', SB_PROMPT)

            end # batch_convert_group_copies_to_components

            UI.menu("Plugins").add_item("Group to Component (&`)"){ self.batch_convert_group_copies_to_components } unless file_loaded?(__FILE__)

        end # module SelectionToys
    end # module Plugins
end # module TT


# ------------------------------------------------------------------------------------------------------------------------


file_loaded( __FILE__ )


# ------------------------------------------------------------------------------------------------------------------------