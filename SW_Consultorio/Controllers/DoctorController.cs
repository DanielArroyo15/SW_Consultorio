using SW_Consultorio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SW_Consultorio.Controllers
{
    public class DoctorController : Controller
    {
        private DB_SWCDEntities db = new DB_SWCDEntities();

        // GET: Doctor
        public ActionResult ListaDoctor()
        {
            return View(db.Medico.ToList());
        }

        public JsonResult Obtener(int medicoid)
        {
            Medico omedico = new Medico();
            bool ProxyCreation = db.Configuration.ProxyCreationEnabled;

            try
            {
                db.Configuration.ProxyCreationEnabled = false;

                if(medicoid!=0)
                {
                    omedico = (from m in db.Medico
                               where m.MedicoID == medicoid
                               select m).FirstOrDefault();
                }
                return Json(omedico, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
            finally
            {
                db.Configuration.ProxyCreationEnabled = ProxyCreation;
            }
        }

        public JsonResult Guardar(Medico omedico)
        {
            bool respuesta = true;

            try
            {
                if(omedico.MedicoID == 0)
                {
                    db.Medico.Add(omedico);
                    db.SaveChanges();
                }
                else
                {
                    var temp = (from m in db.Medico
                                where m.MedicoID == omedico.MedicoID
                                select m).FirstOrDefault();

                    temp.Dni = omedico.Dni.TrimEnd();
                    temp.Nombre = omedico.Nombre.TrimEnd();
                    temp.Apellido = omedico.Apellido.TrimEnd();
                    temp.Telefono = omedico.Telefono.TrimEnd();
                    temp.Email = omedico.Email.TrimEnd();
                    temp.UsuarioID = omedico.UsuarioID;

                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Medico no registrado" + ex;
                respuesta = false;
            }

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ObtenerCitas(int id)
        {
            return View(db.SP_CitaMedicos(id).ToList());
        }

        //public JsonResult Atender(int id)
        //{
        //    bool respuesta = true;
        //    return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        //}

        public JsonResult ObtienePaciente(int id)
        {
            Paciente opaciente;

            try
            {
                if(id!=0)
                {
                    opaciente = (from p in db.Paciente
                                 where id == p.PacienteID
                                 select p).FirstOrDefault();
                }
                else
                {
                    opaciente = new Paciente();
                }
            }
            catch (Exception ex)
            {
                opaciente = new Paciente();
                ViewBag.Error = "Error" + ex;
            }
            return Json( opaciente, JsonRequestBehavior.AllowGet);
        }

        //metodo cambia de estado la cita a estado llamado
        public JsonResult CambiaCitaLlamado(int id)
        {
            bool respuesta = true;
            try
            {
                if (id != 0)
                {
                    db.SP_CitaLlamado(id);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                respuesta = false;
            }

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }




        //cambia de estado la cita a atender

        //public JsonResult CambiaCitaAtender(int id)
        //{
        //    bool respuesta = true;
        //    try
        //    {
        //        if (id != 0)
        //        {
        //            db.SP_CitaAtencion(id);
        //            db.SaveChanges();
        //        }           
        //    }
        //    catch
        //    {
        //         respuesta = false;
        //    }
        //    return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        //}


        //metodo devuelve cita con estado llamado para un medico
        public ActionResult ObtenerCitaLlamados(int id)
        {
            return View(db.SP_ObtenerLlamados(id).ToList());
        }

        //Carga los datos del formulario de atención
        public JsonResult Atender(int id)
        {
            Paciente opaciente = new Paciente();
            bool respuesta = true;
            try
            {
                opaciente = db.SP_DatosPaciente(id);
                

                return Json(opaciente, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                respuesta = false;
            }
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);

        }

        //public ActionResult AtenderPaciente(int id)
        //{
        //    bool respuesta = true;
        //    try
        //    {

        //       var paciente = db.SP_DatosPaciente(id);
        //        Paciente pac = (Paciente)paciente;
        //        //actualizar el model paciente con la data obtenida del SP y devolver vista
        //        return View();
        //    }
        //    catch
        //    {
        //        respuesta = false;
        //    }

        //}
    }
}