//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SW_Consultorio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tratamiento
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tratamiento()
        {
            this.Historia_Clinica = new HashSet<Historia_Clinica>();
        }
    
        public int TratamientoID { get; set; }
        public string Nombre { get; set; }
        public double Precio { get; set; }
        public bool Estado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Historia_Clinica> Historia_Clinica { get; set; }
    }
}