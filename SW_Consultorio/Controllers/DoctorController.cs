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
    }
}