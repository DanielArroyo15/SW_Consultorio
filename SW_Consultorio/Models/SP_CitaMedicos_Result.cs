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
    
    public partial class SP_CitaMedicos_Result
    {
        public Nullable<System.DateTime> FechaAtencion { get; set; }
        public Nullable<System.TimeSpan> InicioAtencion { get; set; }
        public string Obervacion { get; set; }
        public string Dni { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int MedicoID { get; set; }
        public int PacienteID { get; set; }
    }
}
