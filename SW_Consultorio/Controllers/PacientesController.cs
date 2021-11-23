using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SW_Consultorio.Models;

namespace SW_Consultorio.Controllers
{
    public class PacientesController : Controller
    {
        private DB_SWCDEntities db = new DB_SWCDEntities();

        // GET: Pacientes
        public ActionResult ListaPaciente()
        {
            return View(db.Paciente.ToList());
        }

        public JsonResult Obtiene(int pacienteid)
        {
            Paciente opaciente = new Paciente();            
            bool ProxyCreation = db.Configuration.ProxyCreationEnabled;

            try
            {                
                db.Configuration.ProxyCreationEnabled = false;
                if(pacienteid != 0)
                {
                    opaciente = (from p in db.Paciente
                                 where p.PacienteID == pacienteid
                                 select p).FirstOrDefault();
                }
                return Json(opaciente, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex) {
                return Json(ex.Message);
            }
            finally
            {
                db.Configuration.ProxyCreationEnabled = ProxyCreation;
            }
            
        }

        public JsonResult Guardar(Paciente opaciente)
        {
            bool respuesta = true;
            
            try
            {              
                if (opaciente.PacienteID == 0)
                {
                    db.Paciente.Add(opaciente);
                    db.SaveChanges();
                }
                else
                {
                    Paciente tempo = (from p in db.Paciente
                                      where p.PacienteID == opaciente.PacienteID
                                      select p).FirstOrDefault();

                    tempo.Dni = opaciente.Dni.TrimEnd();
                    tempo.Nombre = opaciente.Nombre.TrimEnd();
                    tempo.Apellido = opaciente.Apellido.TrimEnd();
                    tempo.Direccion = opaciente.Direccion.TrimEnd();
                    tempo.Telefono = opaciente.Telefono.TrimEnd();
                    tempo.Email = opaciente.Email.TrimEnd();

                    db.SaveChanges();
                }
            }
           catch (DbEntityValidationException e)
               {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }                
                respuesta = false;
                }           
           
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

    }
        
}
